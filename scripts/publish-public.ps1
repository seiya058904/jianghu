<#
.SYNOPSIS
  Fail-closed one-click public snapshot publishing for the private Jianghu repository.

.DESCRIPTION
  Dry run is the default. It fetches the public main SHA, creates an isolated public
  checkout OUTSIDE this repository, runs scripts/public-snapshot.py to curate a plan and
  prints the privacy/change report. It never writes to any remote.

  -Publish performs the same planning, then applies the reviewed plan inside the isolated
  checkout, runs a cold npm ci / build / test, commits on top of the current origin/main,
  re-fetches, verifies the fast-forward relation and pushes normally to main. It never
  rewrites history, never force pushes and never deletes a remote branch.

  The snapshot always reads a COMMITTED source (default HEAD) and refuses to run unless
  the private working tree is clean.

.PARAMETER Help
  Show this help text.

.PARAMETER DryRun
  Plan and audit only (default when -Publish is absent).

.PARAMETER Publish
  Explicitly authorise a real publication. Requires user authorisation and a clean private
  working tree. Stops on any policy block before touching the public repository.

.PARAMETER SourceRef
  Private commit to snapshot. Defaults to HEAD; -Publish requires it to be the current HEAD.

.PARAMETER PublicRepoUrl
  Public repository URL. Default https://github.com/seiya058904/jianghu.git

.PARAMETER WorkRoot
  Temporary work directory outside the repository. Default: TEMP\jianghu-publish\<timestamp>.

.PARAMETER AllowRemove
  Explicitly approve deleting these public-only paths (must match the plan removals).

.PARAMETER KeepWorkRoot
  Keep the temporary public checkout and logs (useful after a failure review).

.PARAMETER CiTimeoutSeconds
  How long to wait for the Verify and Pages runs of the new public SHA. Default 1200.

.EXAMPLE
  scripts/publish-public.ps1 -DryRun
  scripts/publish-public.ps1 -Publish -AllowRemove 'docs/audits/independent-final/example.md'

.NOTES
  Exit codes: 0 success or NO_PUBLIC_CHANGE, 2 preflight/environment, 3 policy blocked,
  4 public cold validation failed, 5 remote moved / not fast-forward, 6 CI or online
  acceptance failed, 7 parameter or authorisation problem.
#>
[CmdletBinding()]
param(
  [switch]$DryRun,
  [switch]$Publish,
  [switch]$Help,
  [string]$SourceRef = 'HEAD',
  [string]$PublicRepoUrl = 'https://github.com/seiya058904/jianghu.git',
  [string]$WorkRoot,
  [string[]]$AllowRemove = @(),
  [switch]$KeepWorkRoot,
  [int]$CiTimeoutSeconds = 1200
)

$ErrorActionPreference = 'Stop'
$ExpectedCanonSha = '2E2B665657543E81C6B06C121307C9F13685D2C535F762A5B921949AAA8AF393'
$ExpectedCanonBytes = 579299
$TempPrefix = Join-Path $env:TEMP 'jianghu-publish'
$RepoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$script:WorkRootCreated = $false
$script:KeepForFailure = $false
$script:WorkRootPath = $null

function Write-Step([string]$Message) { Write-Host ('==> ' + $Message) -ForegroundColor Cyan }

function Stop-With([string]$Message, [int]$Code) {
  Write-Host ('FAIL(' + $Code + '): ' + $Message) -ForegroundColor Red
  if ($script:WorkRootCreated -and -not $KeepWorkRoot) { $script:KeepForFailure = $true }
  exit $Code
}

# Native tools write normal progress to stderr. Keep ErrorActionPreference local so a
# stderr line from git/npm/gh is data, not a terminating PowerShell error.
function Invoke-Native {
  param([string]$File, [string[]]$CommandArgs, [string]$WorkDir)
  $previous = $ErrorActionPreference
  $ErrorActionPreference = 'Continue'
  $pushed = $false
  $output = @()
  $code = 1
  try {
    if ($WorkDir) { Push-Location -LiteralPath $WorkDir; $pushed = $true }
    $output = & $File @CommandArgs 2>&1
    $code = $LASTEXITCODE
    if ($null -eq $code) { $code = 0 }
  } catch {
    $output = @($_.Exception.Message)
    $code = 1
  } finally {
    if ($pushed) { Pop-Location }
    $ErrorActionPreference = $previous
  }
  return [pscustomobject]@{ Code = $code; Text = (($output | Out-String).Trim()) }
}

function Invoke-Git {
  param([string]$Repository, [string[]]$GitArgs)
  $result = Invoke-Native 'git' (@('-C', $Repository) + $GitArgs)
  if ($result.Code -ne 0) {
    throw ('git ' + ($GitArgs -join ' ') + ' failed in ' + $Repository + ': ' + $result.Text)
  }
  return $result.Text
}

function Invoke-Logged {
  param([string]$File, [string[]]$CommandArgs, [string]$LogFile, [string]$WorkDir)
  $result = Invoke-Native $File $CommandArgs $WorkDir
  if ($LogFile) { Set-Content -LiteralPath $LogFile -Value $result.Text -Encoding UTF8 }
  else { Write-Host $result.Text }
  return $result.Code
}

function Test-PathUnder([string]$Path, [string]$Prefix) {
  $full = [System.IO.Path]::GetFullPath($Path)
  $pref = [System.IO.Path]::GetFullPath($Prefix)
  if (-not $pref.EndsWith([System.IO.Path]::DirectorySeparatorChar)) { $pref = $pref + [System.IO.Path]::DirectorySeparatorChar }
  return $full.StartsWith($pref, [System.StringComparison]::OrdinalIgnoreCase)
}

if ($Help) {
  Get-Help $PSCommandPath -Detailed
  exit 0
}
if ($DryRun -and $Publish) { Stop-With 'Choose either -DryRun or -Publish, not both.' 7 }

try {
  Write-Step ('Private repository: ' + $RepoRoot)
  foreach ($required in @('AGENTS.md', 'docs/PUBLISHING.md', 'scripts/public-snapshot.py', '.git')) {
    if (-not (Test-Path -LiteralPath (Join-Path $RepoRoot $required))) {
      Stop-With ('Not a Jianghu private repository root (missing ' + $required + ').') 2
    }
  }

  $python = Get-Command python -ErrorAction SilentlyContinue
  if (-not $python) { $python = Get-Command python3 -ErrorAction SilentlyContinue }
  if (-not $python) { Stop-With 'Python 3 is required to run scripts/public-snapshot.py.' 2 }
  $pythonVersion = (Invoke-Native $python.Source @('--version')).Text
  if ($pythonVersion -notmatch 'Python 3') { Stop-With ('Python 3 required, found: ' + $pythonVersion) 2 }

  $statusText = (Invoke-Native 'git' @('-C', $RepoRoot, 'status', '--porcelain=v1')).Text
  if ($statusText.Length -gt 0) {
    Write-Host $statusText
    Stop-With 'Private working tree is dirty. Commit or stash the verified RC first: the snapshot only reads committed bytes.' 2
  }
  $head = Invoke-Git $RepoRoot @('rev-parse', 'HEAD')
  $headShort = $head.Substring(0, 7)
  $branch = Invoke-Git $RepoRoot @('rev-parse', '--abbrev-ref', 'HEAD')
  Write-Step ('Private HEAD ' + $headShort + ' on ' + $branch)

  $sourceSha = Invoke-Git $RepoRoot @('rev-parse', ($SourceRef + '^{commit}'))
  if ($Publish -and $sourceSha -ne $head) {
    Stop-With ('-Publish requires the source commit to be HEAD; got ' + $sourceSha.Substring(0,7)) 7
  }

  $privateMarkers = @('docs/archives', 'docs/audits/independent-final/2026-10-18-cleanup', '宋世江湖.md')
  $isPrivateRepo = $false
  foreach ($marker in $privateMarkers) {
    if (Test-Path -LiteralPath (Join-Path $RepoRoot $marker)) { $isPrivateRepo = $true; break }
  }
  if (-not $isPrivateRepo) {
    Stop-With 'This entry point only runs in the private daily repository (private sources absent). Do not publish from the public mirror.' 2
  }
  $canonPath = Join-Path $RepoRoot '宋世江湖.md'
  if (Test-Path -LiteralPath $canonPath) {
    $canonHash = (Get-FileHash -LiteralPath $canonPath -Algorithm SHA256).Hash
    $canonBytes = (Get-Item -LiteralPath $canonPath).Length
    if ($canonHash -ne $ExpectedCanonSha -or $canonBytes -ne $ExpectedCanonBytes) {
      Stop-With ('Private canon changed (SHA ' + $canonHash + ', ' + $canonBytes + ' bytes). Review canon integrity before publishing.') 2
    }
    Write-Step ('Private canon verified: ' + $canonBytes + ' bytes, SHA-256 matches the recorded value')
  } else {
    Write-Host 'NOTE: canon text absent in this checkout; private marker matched through archived evidence directories.'
  }

  $remotes = @(((Invoke-Native 'git' @('-C', $RepoRoot, 'remote')).Text -split [Environment]::NewLine) | Where-Object { $_.Trim().Length -gt 0 })
  if ($remotes -contains 'github-public') {
    Invoke-Git $RepoRoot @('fetch', '--quiet', 'github-public') | Out-Null
    $trackedMain = Invoke-Git $RepoRoot @('rev-parse', 'github-public/main')
    Write-Step ('Fetched github-public/main = ' + $trackedMain)
  } else {
    Write-Host 'NOTE: no github-public remote configured; querying the public URL directly (read-only).'
  }
  $remoteLine = (Invoke-Native 'git' @('ls-remote', '--heads', $PublicRepoUrl, 'main')).Text
  if (-not $remoteLine) { Stop-With ('Cannot resolve public main at ' + $PublicRepoUrl + ' (auth/network).') 2 }
  $remoteMain = ($remoteLine -split '\s+')[0]
  Write-Step ('Public main at ' + $remoteMain)

  if (-not $WorkRoot) {
    if (-not (Test-Path -LiteralPath $TempPrefix)) { New-Item -ItemType Directory -Path $TempPrefix -Force | Out-Null }
    $WorkRoot = Join-Path $TempPrefix (Get-Date -Format 'yyyyMMdd-HHmmss')
  }
  $WorkRoot = [System.IO.Path]::GetFullPath($WorkRoot)
  if (Test-PathUnder $WorkRoot $RepoRoot) { Stop-With 'WorkRoot must be outside the private repository.' 2 }
  if (-not (Test-PathUnder $WorkRoot $env:TEMP)) {
    Stop-With ('WorkRoot must live under the system temp directory so the script can clean it up: ' + $env:TEMP) 2
  }
  if (Test-Path -LiteralPath $WorkRoot) { Stop-With ('WorkRoot already exists, refusing to reuse it: ' + $WorkRoot) 2 }
  New-Item -ItemType Directory -Path $WorkRoot -Force | Out-Null
  $script:WorkRootCreated = $true
  $script:WorkRootPath = $WorkRoot

  $publicClone = Join-Path $WorkRoot 'public'
  $planPath = Join-Path $WorkRoot ('plan-' + $headShort + '.json')
  $logsDir = Join-Path $WorkRoot 'logs'
  New-Item -ItemType Directory -Path $logsDir -Force | Out-Null

  Write-Step 'Creating isolated public checkout outside the private repository'
  $cloneCode = Invoke-Logged 'git' @('clone', '--quiet', '--single-branch', '--branch', 'main', $PublicRepoUrl, $publicClone) (Join-Path $logsDir 'clone.log')
  if ($cloneCode -ne 0) { Stop-With 'git clone of the public repository failed (see logs/clone.log).' 2 }
  $cloneHead = Invoke-Git $publicClone @('rev-parse', 'HEAD')
  if ($cloneHead -ne $remoteMain) {
    Stop-With ('Public checkout HEAD ' + $cloneHead + ' does not match ls-remote main ' + $remoteMain + '. Re-run.') 5
  }

  Write-Step 'Curating the public snapshot plan (policy fail-closed)'
  $planRun = Invoke-Native $python.Source @('scripts/public-snapshot.py', '--source-ref', $sourceSha, '--destination', $publicClone, '--plan', $planPath, '--require-head')
  if ($planRun.Text.Length -gt 0) { Write-Host $planRun.Text }
  $planExit = $planRun.Code
  if (-not (Test-Path -LiteralPath $planPath)) { Stop-With 'Snapshot script produced no plan file.' 2 }
  $plan = Get-Content -LiteralPath $planPath -Raw -Encoding UTF8 | ConvertFrom-Json
  $planSha = (Get-FileHash -LiteralPath $planPath -Algorithm SHA256).Hash.ToLower()
  Write-Host ''
  Write-Host ('Plan status      : ' + $plan.status + '  (policy v' + $plan.policyVersion + ')')
  Write-Host ('Source commit    : ' + $plan.sourceCommit)
  Write-Host ('Public before    : ' + $plan.publicBefore)
  Write-Host ('Public files     : ' + $plan.trackedFiles + '  bytes: ' + $plan.trackedBytes)
  Write-Host ('Changed          : ' + $plan.changed.Count)
  Write-Host ('Removed          : ' + $plan.removed.Count)
  Write-Host ('Excluded private : ' + $plan.excluded.Count)
  Write-Host ('Redacted docs    : ' + $plan.redactions.Count)
  Write-Host ('Blocked          : ' + $plan.blocked.Count)
  if ($plan.changed.Count -gt 0) { Write-Host 'Changed paths:'; $plan.changed | ForEach-Object { Write-Host ('  ' + $_) } }
  if ($plan.removed.Count -gt 0) { Write-Host 'Removed public paths (need -AllowRemove):'; $plan.removed | ForEach-Object { Write-Host ('  ' + $_) } }
  if ($plan.blocked.Count -gt 0) { Write-Host 'Blocked paths:'; $plan.blocked | ForEach-Object { Write-Host ('  ' + $_.path + ' :: ' + $_.reason) } }
  Write-Host ('Plan file        : ' + $planPath)

  if ($planExit -ne 0 -or $plan.status -eq 'BLOCKED') {
    Stop-With ('Snapshot policy blocked ' + $plan.blocked.Count + ' path(s). Fix the source or the policy, then re-plan.') 3
  }
  if ($plan.status -eq 'NO_PUBLIC_CHANGE') {
    Write-Host ''
    Write-Host 'NO_PUBLIC_CHANGE: the curated public tree already matches public main. No commit, no push, no deployment.' -ForegroundColor Green
    exit 0
  }
  if (-not $Publish) {
    Write-Host ''
    Write-Host ('DRY RUN OK: reviewed ' + $plan.changed.Count + ' change(s) / ' + $plan.removed.Count + ' removal(s); nothing was written to any remote.') -ForegroundColor Green
    Write-Host 'Re-run with -Publish (explicit authorisation) to publish this exact plan.'
    exit 0
  }

  $unapproved = @($plan.removed | Where-Object { $AllowRemove -notcontains $_ })
  if ($unapproved.Count -gt 0) {
    Stop-With ('Public-only deletions need explicit approval; missing -AllowRemove for: ' + ($unapproved -join ', ')) 7
  }

  Write-Step ('Publishing to branch codex/public-publish-' + $headShort)
  Invoke-Git $publicClone @('switch', '-c', ('codex/public-publish-' + $headShort)) | Out-Null
  Invoke-Git $publicClone @('config', 'user.name', 'seiya058904') | Out-Null
  Invoke-Git $publicClone @('config', 'user.email', '283110290+seiya058904@users.noreply.github.com') | Out-Null

  $applyArgs = @('scripts/public-snapshot.py', '--source-ref', $sourceSha, '--destination', $publicClone, '--plan', $planPath, '--apply', '--require-head')
  foreach ($removal in $plan.removed) { $applyArgs += @('--allow-remove', $removal) }
  $applyRun = Invoke-Native $python.Source $applyArgs
  if ($applyRun.Text.Length -gt 0) { Write-Host $applyRun.Text }
  if ($applyRun.Code -ne 0) { Stop-With 'Snapshot apply was refused (stale plan, dirty checkout or unapproved removal).' 3 }

  # Compare individual paths with the plan, including files in newly added directories.
  $changedText = (Invoke-Native 'git' @('-C', $publicClone, 'status', '--porcelain=v1', '--untracked-files=all')).Text
  # Invoke-Native trims the block, so the first porcelain line may lose one leading
  # status column; skip the two status characters, then the separating space.
  $actualChanged = @($changedText -split [Environment]::NewLine | Where-Object { $_.Trim().Length -gt 0 } | ForEach-Object { $_.Substring(2).Trim() })
  $expected = @($plan.changed) + @($plan.removed)
  $unexpected = @($actualChanged | Where-Object { $expected -notcontains $_ })
  if ($unexpected.Count -gt 0) {
    Stop-With ('Unexpected paths in the public checkout after apply: ' + ($unexpected -join ', ')) 4
  }

  # The reviewed snapshot is the reproducibility baseline, not the previous
  # public commit. Stage only approved paths before running the cold build.
  Invoke-Git $publicClone (@('add', '--all', '--') + $expected) | Out-Null

  $npm = (Get-Command npm -ErrorAction SilentlyContinue)
  if (-not $npm) { Stop-With 'npm is required for the public cold validation.' 4 }
  Write-Step 'Cold validation in the isolated public checkout (npm ci, build, tests, reproducible story artifacts)'
  $checks = @(
    @{ Name = 'npm-ci'; File = $npm.Source; Args = @('ci'); Log = 'npm-ci.log'; WorkDir = $publicClone },
    @{ Name = 'npm-build'; File = $npm.Source; Args = @('run', 'build'); Log = 'npm-build.log'; WorkDir = $publicClone },
    @{ Name = 'npm-test'; File = $npm.Source; Args = @('test'); Log = 'npm-test.log'; WorkDir = $publicClone },
    @{ Name = 'story-reproducible'; File = 'git'; Args = @('-C', $publicClone, 'diff', '--exit-code', '--', 'story', 'src/generated'); Log = 'story-diff.log'; WorkDir = $null },
    @{ Name = 'snapshot-unchanged'; File = 'git'; Args = @('-C', $publicClone, 'diff', '--exit-code'); Log = 'snapshot-diff.log'; WorkDir = $null },
    @{ Name = 'staged-whitespace'; File = 'git'; Args = @('-C', $publicClone, 'diff', '--cached', '--check'); Log = 'staged-diff-check.log'; WorkDir = $null },
    @{ Name = 'whitespace'; File = 'git'; Args = @('-C', $publicClone, 'diff', '--check'); Log = 'diff-check.log'; WorkDir = $null }
  )
  foreach ($check in $checks) {
    $logFile = Join-Path $logsDir $check.Log
    $code = Invoke-Logged $check.File $check.Args $logFile $check.WorkDir
    if ($code -ne 0) { Stop-With ('Cold validation failed: ' + $check.Name + ' (log: ' + $logFile + ')') 4 }
  }

  Write-Step 'Committing the curated snapshot on top of the current public main'
  $commitMessage = 'public snapshot: ' + $headShort + ' (policy v' + $plan.policyVersion + ')'
  $commitBody = 'source ' + $sourceSha + [Environment]::NewLine + 'public before ' + $plan.publicBefore + [Environment]::NewLine + 'policy v' + $plan.policyVersion + [Environment]::NewLine + 'plan sha256 ' + $planSha
  if ($plan.removed.Count -gt 0) { $commitBody += [Environment]::NewLine + 'removed public-only paths: ' + ($plan.removed -join ', ') }
  Invoke-Git $publicClone @('commit', '--quiet', '-m', $commitMessage, '-m', $commitBody) | Out-Null
  $newSha = Invoke-Git $publicClone @('rev-parse', 'HEAD')
  $postCommit = (Invoke-Native 'git' @('-C', $publicClone, 'status', '--porcelain=v1')).Text
  if ($postCommit.Length -gt 0) { Stop-With 'Public checkout is dirty after commit; refusing to push.' 4 }

  Write-Step 'Re-fetching public main and verifying the fast-forward relation'
  Invoke-Git $publicClone @('fetch', '--quiet', 'origin', 'main') | Out-Null
  $originMain = Invoke-Git $publicClone @('rev-parse', 'origin/main')
  if ($originMain -ne $plan.publicBefore) {
    Stop-With ('Public main moved from ' + $plan.publicBefore + ' to ' + $originMain + '. Re-run the publication; no force push is allowed.') 5
  }
  $ancestor = Invoke-Native 'git' @('-C', $publicClone, 'merge-base', '--is-ancestor', $originMain, $newSha)
  if ($ancestor.Code -ne 0) { Stop-With 'New public commit is not a descendant of origin/main; refusing to push.' 5 }

  Write-Step 'Pushing normally (fast-forward only)'
  $pushRun = Invoke-Native 'git' @('-C', $publicClone, 'push', '--quiet', 'origin', 'HEAD:main')
  if ($pushRun.Code -ne 0) { Stop-With ('Normal push was rejected: ' + $pushRun.Text + ' Re-run after re-planning. No force push is allowed.') 5 }
  $pushedLine = (Invoke-Native 'git' @('ls-remote', '--heads', $PublicRepoUrl, 'main')).Text
  $pushedMain = ($pushedLine -split '\s+')[0]
  if ($pushedMain -ne $newSha) { Stop-With ('Pushed SHA mismatch: remote main is ' + $pushedMain + ', expected ' + $newSha) 5 }
  Write-Step ('Public main is now ' + $newSha)

  $gh = Get-Command gh -ErrorAction SilentlyContinue
  if (-not $gh) {
    Write-Host 'WARNING: gh CLI not found; CI and Pages acceptance for this SHA were NOT verified here.' -ForegroundColor Yellow
  } else {
    Write-Step ('Waiting for Verify and Pages runs of ' + $newSha + ' (timeout ' + $CiTimeoutSeconds + 's)')
    $verify = $null
    $pages = $null
    $deadline = (Get-Date).AddSeconds($CiTimeoutSeconds)
    while ((Get-Date) -lt $deadline) {
      $runList = Invoke-Native $gh.Source @('run', 'list', '--repo', 'seiya058904/jianghu', '--commit', $newSha, '--limit', '40', '--json', 'name,status,conclusion,url')
      $runs = @()
      if ($runList.Code -eq 0 -and $runList.Text.Length -gt 0) {
        # Windows PowerShell's ConvertFrom-Json returns a JSON array as ONE object;
        # enumerate explicitly so per-run filtering is never applied to the array itself.
        try {
          $parsedRuns = $runList.Text | ConvertFrom-Json
          foreach ($item in $parsedRuns) { $runs += $item }
        } catch { $runs = @() }
      }
      $verify = $runs | Where-Object { $_.name -eq 'Verify' } | Select-Object -First 1
      $pages = $runs | Where-Object { $_.name -eq 'Deploy site to GitHub Pages' } | Select-Object -First 1
      if ($verify -and $pages -and $verify.status -eq 'completed' -and $pages.status -eq 'completed') { break }
      $verifyState = 'not-started'
      if ($verify) { $verifyState = $verify.status }
      $pagesState = 'not-started'
      if ($pages) { $pagesState = $pages.status }
      Write-Host ('   waiting: Verify=' + $verifyState + ' Pages=' + $pagesState)
      Start-Sleep -Seconds 15
    }
    if (-not ($verify -and $pages -and $verify.status -eq 'completed' -and $pages.status -eq 'completed')) {
      Stop-With ('Timed out waiting for CI on ' + $newSha + '. Inspect the runs manually; do not claim deployment.') 6
    }
    Write-Host ('Verify : ' + $verify.conclusion + ' ' + $verify.url)
    Write-Host ('Pages  : ' + $pages.conclusion + ' ' + $pages.url)
    if ($verify.conclusion -ne 'success' -or $pages.conclusion -ne 'success') {
      Stop-With 'Verify or Pages did not succeed; report the failure, do not claim the release is live.' 6
    }
    $pagesApi = Invoke-Native $gh.Source @('api', 'repos/seiya058904/jianghu/pages', '--jq', '.status')
    $pagesApiText = $pagesApi.Text
    if (-not $pagesApiText) { $pagesApiText = 'n/a (workflow build type)' }
    Write-Host ('Pages API status: ' + $pagesApiText)
  }

  Write-Host ''
  Write-Host 'PUBLIC RELEASE COMPLETE' -ForegroundColor Green
  Write-Host ('  private source : ' + $sourceSha)
  Write-Host ('  public before  : ' + $plan.publicBefore)
  Write-Host ('  public after   : ' + $newSha)
  Write-Host ('  plan sha256    : ' + $planSha)
  Write-Host ('  changed/removed: ' + $plan.changed.Count + '/' + $plan.removed.Count)
  Write-Host 'Browser and Pages artifact acceptance still has to be performed and recorded separately (see docs/PUBLISHING.md section 6).'
  exit 0
}
catch {
  Write-Host ('FAIL: ' + $_.Exception.Message) -ForegroundColor Red
  if ($script:WorkRootCreated -and -not $KeepWorkRoot) { $script:KeepForFailure = $true }
  exit 2
}
finally {
  if ($script:WorkRootCreated -and -not $KeepWorkRoot -and -not $script:KeepForFailure -and $script:WorkRootPath) {
    if ((Test-Path -LiteralPath $script:WorkRootPath) -and (Test-PathUnder $script:WorkRootPath $TempPrefix)) {
      Remove-Item -LiteralPath $script:WorkRootPath -Recurse -Force
      Write-Host ('Cleaned temporary work directory: ' + $script:WorkRootPath)
    }
  } elseif ($script:WorkRootCreated -and $script:WorkRootPath) {
    Write-Host ('Kept temporary work directory for review: ' + $script:WorkRootPath) -ForegroundColor Yellow
  }
}
