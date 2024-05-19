
/**
 * 订单取消类型
 */
const CANCEL_TYPE = [
  1, // 比赛取消
  2, // 比赛延期
  3, // 比赛中断
  4, // 比赛重赛
  5, // 比赛腰斩
  6, // 比赛放弃
  17,// 赛事提前
  20 // 比赛延迟
];


// 1、足球 2、篮球 3棒、4冰、5网、 6美足 7斯诺克、8乒乓、9排球、10羽毛球、11手球、12拳击、13沙滩排球
// 修正包含数量的玩法数据合并
const NO_MERAGE_MARKETVALUE = {
  // 1、足球
  "1": [
    "7", // 全场比分
    "8", // {主队}准确进球数
    "9", // {客队}准确进球数
    "13", // 独赢 & 进球大小
    "14", // 准确进球数
    "20", // 上半场比分
    "21", // 上半场{主队}准确进球数
    "22", // 上半场{客队}准确进球数
    "23", // 上半场准确进球数
    "27", // 剩余时间获胜
    "28", // 第1个进球
    "29", // 上半场剩余时间获胜
    "30", // 上半场第1个进球
    "31", // 第{X}个进球何时发生？
    "36", // 任何时间进球队员
    "68", // 总进球区间
    "73", // 下半场准确进球数
    "74", // 下半场比分
    "102", // 进球大小 & 两队都进球
    "103", // 半/全场比分
    "109", // 上/下半场进球数均大于{X}
    "110", // 上/下半场进球数均小于{X}
    "117", // 角球总数区间
    "120", // 上半场第1个角球
    "125", // 谁先获得1个角球
    "133", // 点球大战-第1个点球是否射进
    "141", // 净胜分
    "148", // 第1个进球队员
    "222", // 第1个进球方式
    "224", // 第1张罚牌
    "226", // 主队角球总数区间
    "227", // 客队角球总数区间
    "228", // 上半场角球总数区间
    "230", // 上半场谁先获得1个角球
    "232", // 15分钟角球-让球({X}-{X})
    "235", // 加时赛-第1个进球
    "236", // 加时赛-正确比分
    "237", // 点球大战-第1个进球
    "225", // 第1个角球
    "306", // 罚牌让分
  ],
  // 2、篮球
  "2": [
    "49", // 第一节净胜分
    "55", // 第二节净胜分
    "61", // 第三节净胜分
    "67", // 第四节净胜分
    "141", // 净胜分(不含加时)
    "147", // 第一节首先获得20分(三项)
    "200", // 净胜分
    "201", // 首先获得{X}分
    "209", // 净胜分6项
    "210", // 净胜分7项
    "211", // 净胜分12项
    "212", // 净胜分14项
    "214", // 谁先获得第10分
    "215", // 第一节谁先获得10分
    "218", // 总分区间(不含加时)
    "220", // 球员得分
    "221", // 球员三分球
    "271", // 球员助攻
    "272"  // 球员篮板
  ],
  // 3棒
  "3": [
    "275", // 第{X}局胜平负
    "280", // 第{X}局让球
    "283", // 第{X}局独赢
    "285", // {主队}安打总数
    "286", // {客队}安打总数
    "287", // 第{X}局安打总数
    "288", // 第{X}局{主队}安打总数
    "289", // 第{X}局{客队}安打总数
    "290" // 前5局安打总数
  ],
  // 4冰
  "4": [
    "8", // {主队}准确进球数
    "9", // {客队}准确进球数
    "14", // 准确进球数
    "28", // 第{X}个进球
    "204", // 正确比分
    "261", // 第{X}节胜平负
    "265", // 第{X}节准确进球数
    "266", // 第{X}节两队都进球
    "267", // 第{X}节正确比分
    "268", // 第{X}让球
    "294", // 让球(含加时点球大战)
    "297", // 第{X}节{主队}准确进球数
    "298" // 第{X}节{客队}准确进球数
  ],
  // 5网
  "5": [
    "159", // 准确盘数
    "167", //
    "168", // 第{X}盘第{X}局获胜
    "169", // 总局数
    "171", // 获胜者 & 总局数
    "204", // 全场比分
    "208" // 第x盘是否出现抢七局
  ],
  //  6美足
  "6": [
    "8", // {主队}准确进球数
    "9", // {客队}准确进球数
    "14", // 准确进球数
    "28", // 第{X}个进球
    "149", // 最后一个进球
    "265", // 第{X}节准确进球数
    "305" // 达阵总数
  ],
  // 8乒乓
  "8": [
    "174", // 准确局数
    "204", // 全场比分
    "179",  // 第{X}局第{X}分
    "203",  // 第{X}局首先获得{X}分
  ],
  // 9排球
  "9": [
    "174", // 准确局数
    "204", // 全场比分
    "253", // 第{X}局让分
    "255", // 第{X}局单/双
    "256"  // 第{X}局谁先获得{X}分
  ],
  // 10羽毛球
  "10": [
    "174", // 准确局数
    "179",  // 第{X}局第{X}分
    "203",  // 第{X}局首先获得{X}分
    "204" // 全场比分
  ],
  // 13沙滩排球
  "13": [
    "159", // 准确局数
    "204", // 正确比分
    "253", // 第{X}局让分
    "255", // 第{X}局单/双
    "256"  // 第{X}局谁先获得{X}分
  ]
};


