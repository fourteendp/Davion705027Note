/**
 *
    推送业务
    ├─主动推送开关(C4)
    │  ├─菜单栏目(C301)
    │  ├─财务推送(C108)
    │  └─赛事开赛状态(C302)
    ├─心跳
    │  └─客户端维持心跳
    ├─注单-盘口赔率(C2)
    │  └─盘口赔率(C105)
    ├─订单(C3)
    │  └─订单状态(C201)
    └─赛事订阅(C1)
    ├─盘口赔率(C105)
    ├─注单盘口赔率(C106)
    ├─赛事事件(C102)
    ├─赛事比分(C103)
    ├─赛事状态(C101)
    ├─赛事盘口新增(玩法)(C303)
    ├─赛事视频/动画状态(C107)
    ├─赛事订阅C1-玩法数量（C110）
    └─赛事级别盘口状态(C104)

    ----C21订阅相关:
    C210

    ----C3订阅相关: (投注的时候 已订阅)
    C201
    C202
    C203   触发接口请求

    ----C4订阅相关:
    C106   可能触发接口请求
    C302   可能触发接口请求
    C304
    C801

    ----C5订阅相关: (已订阅)
    C301   可能触发接口请求
    C3011  触发接口请求

    ----C51订阅相关:
    C501

    ----C6订阅相关:
    C601   触发接口请求

    ----C8订阅相关:(已订阅)
    C101     触发接口请求     滚球从未开赛到开始时 需要调用接口
    C102
    C103

    C104    可能触发接口请求
    C105    可能触发接口请求
    C107
    C110
    C112     触发接口请求
    C120
    C211
    C303     触发接口请求


    ----C81订阅相关:已知
    C1021

    ----C9订阅相关: 已知
    C901

    04/05  c4 c51 c81

    ///0407 第一场 104  105 107     110  112  113 114 115
    ///0407 第二场 120
    - C101  赛事状态       C8订阅  ****(滚球从未开赛到开始时 需要调用接口)
    - C102 赛事事件  	C8订阅
    - C103 赛事比分  	C8订阅

    - C104 赛事级别盘口状态  	C8订阅  开--关 开--锁
    - C105  盘口赔率  	C8订阅     ****(坑位发生变化   坑位不一致 接口需要重新获取  特别是冠军盘)

    - C106    盘口赔率  	C4订阅
    C107 赛事视频/动画状态	C8订阅

    C108  财务推送 收到这个命令需要刷新整个页面
    - C109 赛事开盘推送    列表接口拉取
    - C110 赛事玩法数量同步到玩法数量显示区域	C8订阅

    -C112 玩法集变更	C8订阅   ****(接口拉取)

    C113 缺失 C8订阅
    - C114 缺失 C8订阅  次要玩法
    C115 缺失 C8订阅  详情-视频直播 进球图标显示 推送  足球进球事件   横批   footbalevents


    -C120 盘口结束时间(针对冠军赛事)	C8订阅      冠军的右边菜单事件的数据同步

    C201 注单订阅  订单状态改变使用		C3订阅-----xlight
    C202 未结算订单数 未结算订单数量变化		C3订阅-----xlight
    C203 用户账变 重新请求用户余额接口	C3订阅-----xlight
    C210 赛事提前结算投注项    提前结算投注项数据变化通知			C21订阅-----xlight
    C211 赛事提前结算状态变化		C8订阅-----xlight

    - C301 菜单栏目数量变化时触发	C5订阅   可能废弃    nico问下 ****(需确认)
    - C302 赛事开赛状态			C4订阅         ****(列表全局接口拉取)
    - C303 新增玩法/盘口通知		C8订阅             详情就拉详情接口 )  ****(bymid 接口(列表过滤筛选))

    - C501 新版UI菜单			C51订阅     nico确认下  ****(需确认)
    C601 热门赛事变化时触发	C6订阅    h5不用管

    - C801 倒计时补充			C4订阅   //  同步到中央数据库
    - C901 关盘补充		C9订阅         /// 联赛折叠的时候订阅
    C1021 赛事事件 通知赛事变化 更新指定模块显示逻辑          投注的时候 注单历史 	C81订阅  -----xlight

    - C3011 菜单栏顺序变更			C5订阅   nico确认下  ****(需确认)
 */

///接收命令定义
class WsType {
  ///订阅
  ///======================= 发送命令定义 =======================
  ///心跳
  static const C0 = "C0";

  ///注单-盘口赔率(C2)
  static const C2 = "C2";

  ///订单(C3)
  static const C3 = "C3";

  ///主动推送开关(C4)
  static const C4 = "C4";

  ///菜单推送(C5)
  static const C5 = "C5";

  ///热门/直播推送(C6)
  static const C6 = "C6";

  /// 全局开关(C7)
  static const C7 = "C7";

  ///  赛事订阅(C8)
  static const C8 = "C8";

  /// 联赛指令(C9)
  static const C9 = "C9";


  ///发送注单盘口赔率命令C118
  static const C118 = "C118";


  ///列表接口订阅
  static const C01 = "C01";

  ///注单-盘口赔率(C21)
  static const C21 = "C21";

  ///新版菜单推送(C51)
  static const C51 = "C51";

  /// 主动关闭连接指令
  static const C00 = "C00";

  ///======================= 发送命令定义 =======================
  ///
  ///======================= 接受命令定义 =======================

  ///列表接口订阅(收到C303后订阅C03)
  static const C03 = "C03";

  ///首页右侧详情订阅(getMatchOddsInfo2)
  static const C04 = "C04";

  /// 详情订阅(getMatchOddsInfo1)
  static const C05 = "C05";

  /// 赛事状态
  static const C101 = "C101";

  /// 赛事事件
  static const C102 = "C102";

  /// 赛事比分
  static const C103 = "C103";

  ///赛事级别盘口状态
  static const C104 = "C104";

  ///盘口状态、赔率
  static const C105 = "C105";

  ///注单订阅盘口状态、赔率
  static const C106 = "C106";

  ///赛事视频/动画状态
  static const C107 = "C107";

  ///财务推送
  static const C108 = "C108";

  ///
  static const C109 = "C109";

  ///赛事订阅C1-玩法数量（C110）
  static const C110 = "C110";

  ///玩法集变更
  static const C112 = "C112";
  static const C114 = "C114";

  /// C120盘口结束时间(针对冠军赛事)
  static const C120 = "C120";

  /// 订单状态 注单结算
  static const C201 = "C201";

  /// 未结算订单数
  static const C202 = "C202";

  /// 重新获取余额
  static const C203 = "C203";

  /// 提前结算投注项 C21订阅
  static const C210 = "C210";

  /// 赛事提前结算状态变化
  static const C211 = "C211";

  /// 菜单栏目
  static const C301 = "C301";

  /// 赛事开赛通知状态
  static const C302 = "C302";

  ///新增玩法/盘口通知
  static const C303 = "C303";

  /// C304主副盘变更
  static const C304 = "C304";

  /// C501 新版菜单   新版菜单数量变化触发
  static const C501 = "C501";

  /// C501 新版菜单   新版菜单数量变化触发
  static const C601 = "C501";

  ///补充赛事时间
  static const C801 = "C801";

  /// 联赛关盘补充(C901)
  static const C901 = "C901";

  /// 菜单顺序变更
  static const C1021 = "C1021";

  /// 菜单栏顺序变更
  static const C3011 = "C3011";

  ///======================= 接受命令定义 =======================
  final String type;
  final dynamic data;

  WsType(this.type, this.data);
}

///ws销毁使用
List<String> wsNameList = [
  WsType.C0,
  WsType.C2,
  WsType.C3,
  WsType.C4,
  WsType.C5,
  WsType.C6,
  WsType.C7,
  WsType.C8,
  WsType.C9,
  WsType.C21,
  WsType.C51,
  WsType.C00,
  WsType.C01,
  WsType.C03,
  WsType.C04,
  WsType.C05,
];
