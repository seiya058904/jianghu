import {npcArchetypes as legacy} from './campaign-catalog.ts';
// Registry counts archetypes, not file variants or renamed copies.
export const npcArchetypes={...legacy,
 martialAdult:{file:'v6/npc-martial-adult.webp',description:'成年习武者，朴素练功衣，空手站姿；另有不同面孔与体格的蓝衣变体'},
 robedElder:{file:'v6/npc-robed-elder.webp',description:'高龄长衫前辈，白发须，灰蓝衣；另有圆脸分须褐衣变体'},
 martialElder:{file:'v6/npc-martial-elder.webp',description:'老年习武者，宽肩短须橄榄衣；另有明显高龄瘦面红衣变体'},
 matureWoman:{file:'v6/npc-mature-woman.webp',description:'中年女性同僚，素衣木簪；另有圆脸束袖绿衣馆师变体'},
};
