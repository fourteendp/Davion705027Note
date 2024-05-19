//显示球头值得玩法
const MARKET_FLAG_LIST=[
  '2','3','4','10','11','18','19','26','33','34','71','87','88','97','98','113','114','115',
  '116','121','122','123','124','127','128','130','134','143','232','233','269','270',
  '69','306','307','308','309','314','315','316','317','324','325','327','328','331','332','334','335'
];

//显示球头值得玩法 中的所有让球玩法
const MARKET_RANG_FLAG_LIST=[
  '3', //全场让球胜平负
  '4', //全场让球
  '19', //半场让球
  '33', //15分钟进球-让球({a}-{b})
  '71', //下半场让球胜平负
  '113', //角球让球
  '121', //上半场角球让球
  '128', //加时赛-让球
  '130', //加时赛-上半场让球
  '143', //下半场让球
  '232', //15分钟角球-让球({a}-{b})
  '269', //全场让球
  '270', //半场让球
  '324', //黄牌让分
  '327', //上半场黄牌让分
];
//投注结算后玩法名称无需显示比分
const MARKET_NO_SCORE_LIST=[
  '334',
  '367',//全场反波胆
  '368',//上半场反波胆
  '369',//下半场反波胆
  '373',//
  '374',//
  '375',//
  '376',//
  '377',//
  '378',//
  '381',//
  '382',//

];

//要添加球头值下限的大小玩法(全场)
const MARKET_BIG_SMALL_PLAY_LIST = [
  '2', //全场大小
  '18',//半场大小
  '26',//下半场大小
  '34',//15分钟进球-大小({a}-{b})
  '114',//角球大小
  '122',//上半场角球大小
  '127',//加时赛-大小
  '134',//点球大战-大小
  '233',//15分钟角球-大小({a}-{b})
  '307',//罚牌大小
  '309',//上半场罚牌大小
  '325',//黄牌大小
  '328',//上半场黄牌大小
  '331',//加时赛-角球大小
  '332',//加时赛-上半场大小
  '335',//点球大战-前5轮大小
];
//要添加球头值下限的大小玩法(主队)
const MARKET_HOME_PLAY_LIST = [
  '10',//{主队}进球大小
  '87',//上半场{主队}进球大小
  '88',//下半场{主队}进球大小
  '115',//{主队}角球大小
  '123',//上半场{主队}角球大小
  '314',//{主队}罚牌大小
  '316',//上半场{主队}罚牌大小
];
//要添加球头值下限的大小玩法(客队)
const MARKET_AWAY_PLAY_LIST = [
  '11',//{客队}进球大小
  '97',//上半场{客队}进球大小
  '98',//下半场{客队}进球大小
  '116',//{客队}角球大小
  '124',//上半场{客队}角球大小
  '315',//{客队}罚牌大小
  '317',//上半场{客队}罚牌大小
];