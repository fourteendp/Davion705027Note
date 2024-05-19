// 所有体育玩法编号列表
const ALL_SPORT_PLAY = {
  1:"全场独赢",
  2:"全场大小",
  3:"全场让球胜平负",
  4:"全场让球",
  5:"平局退款",
  6:"双重机会",
  7:"全场比分",
  8:"{home}准确进球数",
  9:"{away}准确进球数",
  10:"{home}进球大小",
  11:"{away}进球大小",
  12:"两队都进球",
  13:"独赢 & 进球大小",
  14:"准确进球数",
  15:"进球单/双",
  16:"最多进球的半场",
  17:"半场独赢",
  18:"上半场大小",
  19:"半场让球",
  20:"上半场比分",
  21:"上半场{home}准确进球数",
  22:"上半场{away}准确进球数",
  23:"上半场准确进球数",
  24:"上半场两队都进球",
  25:"下半场独赢",
  26:"下半场大小",
  27:"剩余时间获胜",
  28:"第{X}个进球",
  29:"上半场剩余时间获胜",
  30:"上半场第{X}个进球",
  31:"第{X}个进球何时发生？",
  32:"15分钟进球-赛果({a}-{b})",
  33:"15分钟进球-让球({a}-{b})",
  34:"15分钟进球-大小({a}-{b})",
  35:"首个进球球员",
  36:"任意时间进球球员",
  37:"全场独赢",
  38:"总分",
  39:"让分",
  40:"总分单/双",
  41:"是否进行加时赛",
  42:"上半场进球单/双",
  43:"上半场平局退款",
  44:"第1节赛果",
  45:"第1节总分",
  46:"第1节让分",
  47:"第1节总分单/双",
  48:"第1节独赢",
  49:"第1节净胜分",
  50:"第2节赛果",
  51:"第2节总分",
  52:"第2节让分",
  53:"第2节总分单/双",
  54:"第2节独赢",
  55:"第2节净胜分",
  56:"第3节赛果",
  57:"第3节总分",
  58:"第3节让分",
  59:"第3节总分单/双",
  60:"第3节独赢",
  61:"第3节净胜分",
  62:"第4节赛果",
  63:"第4节总分",
  64:"第4节让分",
  65:"第4节总分单/双",
  66:"第4节独赢",
  67:"第4节净胜分",
  68:"总进球数区间",
  69:"上半场让球赛果",
  70:"上半场双重机会",
  71:"下半场让球赛果",
  72:"下半场双重机会",
  73:"下半场准确进球数",
  74:"下半场比分",
  75:"下半场进球单/双",
  76:"下半场两队都进球",
  77:"{home}获胜退款",
  78:"{home}进球单/双",
  79:"{away}零失球",
  80:"{away}零失球获胜",
  81:"{home}零失球",
  82:"{home}零失球获胜",
  83:"{home}上/下半场全胜",
  84:"{home}任意半场获胜",
  85:"{home}最高得分半场",
  86:"{home}上/下半场均进球",
  87:"上半场{home}进球大小",
  88:"下半场{home}进球大小",
  89:"下半场{home}零失球",
  90:"上半场{home}零失球",
  91:"{away}获胜退款",
  92:"{away}进球单/双",
  93:"{away}上/下半场全胜",
  94:"{away}任意半场获胜",
  95:"{away}最高得分半场",
  96:"{away}上/下半场均进球",
  97:"上半场{away}进球大小",
  98:"下半场{away}进球大小",
  99:"下半场{away}零失球",
  100:"上半场{away}零失球",
  101:"赛果 & 两队都进球",
  102:"进球大小 & 两队都进球",
  103:"半/全场比分",
  104:"半/全场",
  105:"上半场赛果 & 上半场两队都进球",
  106:"下半场赛果 & 下半场两队都进球",
  107:"双重机会 & 两队都进球",
  108:"上/下半场两队都进球",
  109:"上/下半场进球数均大于{X.5}",
  110:"上/下半场进球数均小于{X.5}",
  111:"哪个球队获得角球多？",
  112:"最后一个角球",
  113:"角球让球盘",
  114:"角球大小盘",
  115:"{home}角球大小盘",
  116:"{away}角球大小盘",
  117:"角球总数区间",
  118:"角球单/双",
  119:"上半场哪个球队获得角球多？",
  120:"上半场第{X}个角球",
  121:"上半场角球让球盘",
  122:"上半场角球大小盘",
  123:"上半场{home}角球大小盘",
  124:"上半场{away}角球大小盘",
  125:"谁先获得{X}个角球",
  126:"加时赛-赛果",
  127:"加时赛-大小",
  128:"加时赛-让球",
  129:"加时赛-上半场赛果",
  130:"加时赛-上半场让球",
  131:"是否进行点球大战",
  132:"点球大战-获胜者",
  133:"点球大战-第{X}个点球是否射进",
  134:"点球大战-大小盘",
  135:"晋级球队",
  136:"冠军",
  137:"获胜方式",
  138:"比赛中出现红牌",
  139:"{home}获得红牌",
  140:"{away}获得红牌",
  141:"净胜分(不含加时)",
  142:"下半场平局退款",
  143:"下半场让球盘",
  144:"谁先开球",
  145:"第{X}节{home}总分",
  146:"第{X}节{away}总分",
  147:"第{X}节首先获得{Y}分 三项",
  148:"第{X}个进球队员",
  149:"最后进球队伍",
  150:"最后进球队员",
  151:"进2+球的队员",
  152:"进3+球的队员",
  153:"独赢",
  154:"让盘",
  155:"让局",
  156:"{home}总局数",
  157:"{away}总局数",
  158:"出现抢七局",
  159:"准确盘数",
  160:"总局数单/双",
  161:"双重赛果(第1盘/全场获胜)",
  162:"第{X}盘获胜",
  163:"第{X}盘让局",
  164:"第{X}盘总局数",
  165:"第{X}盘总局数单/双",
  166:"第{X}盘正确比分",
  167:"第{X}盘第{Y}局和第{Y}+1局谁获胜多",
  168:"第{X}盘第{Y}局获胜",
  169:"总盘数",
  170:"第{X}盘抢七局正确比分",
  171:"获胜者 & 总局数",
  172:"让分",
  173:"总分",
  174:"准确局数",
  175:"第{X}局获胜",
  176:"第{X}局让分",
  177:"第{X}局总分",
  178:"第{X}局单/双",
  179:"第{X}局第{Y}分",
  180:"比赛进入决胜局",
  181:"让局",
  182:"总局数",
  183:"单双局",
  184:"第{X}局获胜",
  185:"第{X}局让分",
  186:"第{X}局总分",
  187:"第{X}局总分单/双",
  188:"第{X}局首先到达{Y}分",
  189:"第{X}局单杆得分最高的选手",
  190:"第{X}局单杆最高分",
  191:"第{X}局单杆破百",
  192:"第{X}局选手1单杆破百",
  193:"第{X}局选手2单杆破百",
  194:"第{X}局会不会有犯规",
  195:"第{X}局第{Y}个进球的选手",
  196:"第{X}局打进最后一球的选手",
  197:"第{X}局最后得分",
  198:"{home}总分",
  199:"{away}总分",
  200:"净胜分 三项",
  201:"首先获得{X}分",
  202:"总局数",
  203:"第{X}局首先获得{Y}分 ",
  204:"全场比分",
  205:"{主队选手}赢得一盘 ",
  206:"{客队选手}赢得一盘 ",
  207:"任何一盘未失一局获胜",
  208:"第{X}盘是否出现抢七局 ",
  209:"净胜分 6项",
  210:"净胜分 7项",
  211:"净胜分 12项",
  212:"净胜分 14项",
  213:"最高得分的小节",
  214:"谁先获得第{X}分(含加时)",
  215:"第{X}节首先获得{Y}分",
  216:"独赢&总分",
  217:"准确总分大小",
  218:"总分区间",
  219:"上半场净胜分",
  220:"球员得分",
  221:"球员三分球",
  222:"第{X}个进球方式",
  223:"谁会进球",
  224:"第{X}张罚牌",
  225:"第{X}个角球",
  226:"{home}角球总数区间",
  227:"{away}角球总数区间",
  228:"上半场角球总数区间",
  229:"上半场角球单/双",
  230:"上半场谁先获得{X}个角球",
  231:"15分钟角球-赛果({a}-{b})",
  232:"15分钟角球-让球({a}-{b})",
  233:"15分钟角球-大小({a}-{b})",
  234:"加时赛是否进球",
  235:"加时赛-第{X}个进球",
  236:"加时赛-正确比分",
  237:"点球大战-第{X}个进球",
  238:"点球大战-净胜分",
  239:"点球大战-准确进球数",
  240:"点球大战-单/双",
  241:"点球大战-正确比分",
  242:"独赢",
  243:"让球",
  244:"总分",
  245:"主队得分大小",
  246:"客队得分大小",
  247:"得分单双",
  248:"是否加时",
  249:"前5局让球",
  250:"前5局大小",
  251:"前5局主队得分大小",
  252:"前5局客队得分大小",
  253:"第{X}局让分",
  254:"第{X}局大小",
  255:"第{X}局单双",
  256:"第{X}局谁先获得{Y}分",
  257:"{home}进球大小(含加时点球大战)",
  258:"{away}进球大小(含加时点球大战)",
  259:"独赢",
  260:"正确比分",
  261:"第{X}节胜平负",
  262:"第{X}节大小",
  263:"第{X}节{home}的大小",
  264:"第{X}节{away}的大小",
  265:"第{X}节准确进球数",
  266:"某{X}节两队都进球",
  267:"第{X}节正确比分",
  268:"第{X}节让球",
  340:"净胜分(4+)",
  367:"全场反波胆",
  10001:"冠军",
  10002:"垫底",
  10003:"前二",
  10004:"前四",
  10005:"前六",
  10006:"升级",
  10007:"降级",
  10008:"排名上半区",
  10009:"排名下半区",
  10010:"进球最多的球队",
  10011:"进球最少的球队",
  10012:"最佳射手",
  10013:"最有价值球员",
  10014:"决赛对阵球队",
  10015:"下一任总理",
  10016:"下一任总统",
  10017:"获胜党派",
  20001:"全场独赢",
  20004:"全场让球",
  20002:"全场大小",
  200033:"冠军",
  200034:"前二",
  200035:"前三",
};

// 让球玩法
const PLAY_LET_BALL =  [
  '4', // 让球盘
  '19', // 半场让球
  // '32', // 15分钟进球-赛果
  '33', // 15分钟进球-让球
  '39', // 让分
  '46', // 第1节 让分
  '52', // 第2节 让分
  '58', // 第3节 让分
  '64', // 第4节 让分
  '113',// 角球让球盘
  '121', // 半场让球
  '128', // 加时赛上半场
  '130', // 加时赛下半场
  '154', // 让盘
  '155', // 让局
  '163', // 让局
  '172', // 让分
  '176', // 第{X}局让分
  '181', // 让局
  '185', // 第{X}局让分
  '232', // 15分钟角球让球
  '243', // 让球
  '249', // 5局让球
  '253', // 第{X}局让分
  '268',  // 第{X}局让球
  '306',  // 罚牌全场让球
  '308',  // 上半场罚牌比分
  '324',  // 黄牌让分
  '327',  // 上半场黄牌让分
  '334' // 点球大战-让球
];

// 进球玩法
const PLAY_GOAL = [
  '28', // 第{X}个进球
  '149' // 最后进球队伍
];
//详情部分特殊玩法
const PLAY_RESULT = [
  '3', //全场让球赛果
  '7', //"全场比分"
  '13', // 独赢&进球大小
  '2', //"全场大小",
  '18', //"上半场大小",
  '36', // 任何时间进球球员
  '49', // 第1节净胜分
  '55', // 第2节净胜分
  '61', // 第3节净胜分
  '67', // 第4节净胜分
  '69', //上半场让球赛果
  '71', //下半场让球赛果
  '102', // 进球大小 &两队都进球
  '171', // 独赢&总局数
  '238',  // 点球大战净胜分
  '339',// 独赢 & 准确回合数
  '359',//半场/全场&准确进球数
  '360',//净胜4+
  '141',//净胜4+
  '340',//净胜分
  '383'//下半场净剩分
];
// 各种玩法(不显示盘口的)
const PLAY_ALL_KINDS = [
  '3',  // 全场让球赛果
  '7', //"全场比分"
  '8',  // {home}准确进球数
  '9',  // {away}准确进球数
  '20',
  '28', // 第{X}个进球
  '30', // 上半场第{X}个进球
  '49', // 第1节净胜分
  '55', // 第2节净胜分
  '61', // 第3节净胜分
  '67', // 第4节净胜分
  '68', // 总进球数区间
  '69', // 上半场让球赛果
  '71', // 下半场让球赛果
  '108',// 上/下半场两队都进球
  '109',// 上/下半场进球数均大于{X.5}
  '110',// 上/下半场进球数均小于{X.5}
  '141', //"净胜分(不含加时)",
  '340',// 净胜分(不含加时)
  '147',// 第{X}节首先获得{Y}分 三项
  '167',// 第{X}盘第{Y}局和第{Y}+1局谁获胜多
  '168',// 第{X}盘第{Y}局获胜
  '179',// 第{X}局第{Y}分
  '195',// 第{X}局第{Y}个进球的选手
  '196',// 第{X}局打进最后一球的选手
  '200',// 净胜分 三项
  '201',// 首先获得{X}分
  '203',// 第{X}局首先获得{Y}分
  '208',// 第{X}盘是否出现抢七局
  '209',// 净胜分 6项
  '210',// 净胜分 7项
  '211',// 净胜分 12项
  '212',// 净胜分 14项
  '215',// 第{X}节首先获得{Y}分
  '226',// {home}角球总数区间
  '227',// {away}角球总数区间
  '228',// 上半场角球总数区间
  '229',// 上半场角球单/双
  '236',// 加时赛-正确比分
  '241',// 点球大战正确比分
  '255',// 第{X}局单/双
  '256',// 第{X}局谁先获得{Y}分
  '260', // 正确比分(不含加时)
  '261', // 第{X}节胜平负
  '267',  // 第{X}局正确比分
  '235', //点球大战-第x个点球
  '133', // 第X个角球
  '225', // 第X张罚牌
  '224', //下张罚牌
  // '341',
  // '342'
  '361',
  '362'
];
// 球员玩法id
const PLAYER_ID = [
  '220', // 球员得分(篮球)
  '221', // 球员三分球(篮球)
  '271', // 球员助攻(篮球)
  '272'  // 球员篮板(篮球)
];

// 投注数据合并时使用到的玩法id
const BETTING_USED_PLAY = [
  '202', //"总局数",
  '208' //"第{X}盘是否出现抢七局 ",
];


// 滚球和今日里面需要显示比分的玩法
const PLAY_TODAY_SCORE = [
  '4', // 让球盘
  '19', // 半场让球
  '27', // 剩余时间获胜
  '29', // 上半场剩余时间获胜
  // '32', // 15分钟进球-赛果
  '33', // 15分钟进球-让球
  '113', // 角球全场让球
  '121', // 角球上半场让球
  '128', // 加时赛-让球
  '130', // 加时赛-上半场让球
  '143', // 下半场让球盘
  '232', // 15分钟角球让球
  '269', // 全场让球
  '270', // 半场让球
  '306', // 罚牌让分
  '308', // 上半场罚牌比分
  '324', // 黄牌让分
  '327', // 上半场黄牌让分
  '371', // 15分钟玩法罚牌让球
  // '334', // 点球大战-让球
  // '341', // 上半场
  // '342'  // 下半场
];