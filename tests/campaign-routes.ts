export const campaignRoutes:Record<string,string[]>={
 harbor:[],
 name:['end_honor'],
 together5:['aftermath_road'],
 teacher:['aftermath_teach'],
 captain:['route_water'],
 apart:['qiao_single','aftermath_road'],
 scar:['press_again','load_shoulder','bridge_jump','guard_meet','duel_risk','end_rescue'],
 lost:['final_hurry','end_rescue'],
};
export function pickChoice<T extends {id:string}>(choices:T[],preferred:string[]){return choices.find(c=>preferred.includes(c.id))??choices[0]}
