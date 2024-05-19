import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/analyze_news/analyze_news_dialog.dart';
import 'package:flutter_ty_app/app/modules/login/login_head_import.dart';
import 'package:get/get.dart';

import '../../../../../global/user_controller.dart';
import '../../../../../services/api/analyze_detail_api.dart';
import '../../../../../services/api/match_detail_api.dart';
import '../../../../../services/models/res/analyze_favorite_article_entity.dart';
import '../../../../../services/models/res/analyze_news_entity.dart';
import '../../../../../services/models/res/macth_details_news_new_entity.dart';
import '../../../../../services/models/res/match_details_news_entity.dart';
import '../../../../../utils/relative_date_format.dart';
import '../../../../match_detail/controllers/analyze_tab_controller.dart';
import '../../../../match_detail/controllers/match_detail_controller.dart';
import 'Test.dart';
import 'analyze_news_state.dart';
typedef  AnalyzeNewListener =Function(AnalyzeNewsEntity entity);
class AnalyzeNewsLogic extends GetxController {
  static AnalyzeNewsLogic get to => Get.find();
  final AnalyzeNewsState state = AnalyzeNewsState();
  String? mid;
  bool noData = true;
  String? tag;

  @override
  void onReady() {
    // TODO: implement onInit
    initData();
    super.onReady();
  }

  Future<void> initData() async {
    requestData();
  }

  void requestData() async {
    MatchDetailController controller =
        Get.find<MatchDetailController>(tag: tag);
    print("------");
    print(tag);
    mid = controller.detailState.mId;
    print("========>mid2  ${mid}");
    requestGetArticle(mid: mid ?? "");

    //测试代码
    bool env = const bool.fromEnvironment("PACKAGE_MOCK", defaultValue: false);
    if (env) {
      requestTest();
    }
  }

  void requestGetFavoriteArticle(String aricleId) {
    AnalyzeDetailApi.instance().getFavoriteArticle(aricleId, mid).then((value) {
      value.data?.forEach((element) {
        element.showTime =
            "${RelativeDateFormat.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(element?.showTime ?? "0") * 1000))}";
      });
      state.analyzeFavoriteArticleList.value = value.data ?? [];

      print("是否有推荐数据  ${value.data?.length}");

      update(["analyzeList", "analyzeNewsComponentBuilder"]);
      update(["buildGuessBtn"]);
    });
  }

  void requestGetArticle({String mid = "", String type = "1",AnalyzeNewListener? analyzeNewListener}) {
    print("========>getArticle mid  ${mid}  type  ${type} ");
    DateTime startOfDay = DateTime.now();
    String t = startOfDay.millisecondsSinceEpoch.toString();

    AnalyzeDetailApi.instance().getArticle(mid, type, t).then((value) {
      update(["analyzeList"]);
      print("========>请求成功  ${value.data?.toJson()}  ");
      if (type == "1") {
        state.analyzeNewsEntity.value = value.data ?? AnalyzeNewsEntity();
        requestGetFavoriteArticle(value.data?.id ?? "");
        state.analyzeNewsEntity.value?.showTime =
        "${RelativeDateFormat.format(DateTime.fromMicrosecondsSinceEpoch(((int.tryParse(value.data?.showTime ?? "0") ?? 0) * 1000).toInt()))}";
        if (state.analyzeNewsEntity.value.articleContent?.isNotEmpty == true) {
          noData = false;
        } else {
          noData = true;
        }
        update([
          "analyzeNewsComponentBuilder",
          "buildMeassgeBody",
        ]);

      }else{
        print("==========>analyzeNewListener   ${analyzeNewListener}");
        if(analyzeNewListener!=null) {

          value.data?.showTime =
          "${RelativeDateFormat.format(DateTime.fromMicrosecondsSinceEpoch(((int.tryParse(value.data?.showTime ?? "0") ?? 0) * 1000).toInt()))}";

          analyzeNewListener(value.data ?? AnalyzeNewsEntity());
        }
      }


    });
  }

  void requestTest() {
    //  测试代码
    Future.delayed(Duration(seconds: 8), () {
      String data =
          "[{\"articleContent\":\"<p data-sider-select-id=\\\"57baed4d-ebf9-419f-a9a6-cce68eed0e4e\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"2cde4b71-4a14-4ead-9a4a-79f5ed5a109b\\\">西班牙甲级联赛，马洛卡VS皇家马德里。</span></p><p data-sider-select-id=\\\"57baed4d-ebf9-419f-a9a6-cce68eed0e4e\\\"><img src=\\\"IMAGE_DOMAIN_YUNYING_PLACEHOLDER/group1/M00/31/5F/CgURt2YaLZeAN_SLAAgfT44ZSIc777.png\\\"></p><p><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"d0734e51-2857-4117-8573-aca906de6a2f\\\">马洛卡西甲中下游球队，本赛季状态较为低迷，在经历了30轮联赛过后，球队仅仅取得了6胜13平11负积31分，排在联赛第15位，虽然目前离降级区差了6分，球队还是要努力争取拿分，近期的马洛卡状态不佳，上一场国王杯1-1战平毕尔巴鄂竞技，近10场各项赛事仅3胜5派2负，进攻端也只打入了8粒球，场均进球不到1粒，好在防守端只丢失了7球，且有4场零封对手，防守还算尚可，值得一提的是，马洛卡主场作战能力有所提升，近10个赛事主场6胜2平2负，胜率多达6成。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">皇马西甲豪门顶级球队，目前是以23胜6平1负积75分的战绩，排在西甲榜首，领先第2的巴萨8个积分，就球队目前的状态来看，最后几场联赛，应该是能拿下联赛冠军的，在上场欧冠主场战平曼城，没有拿到优势，还是非常可惜的，近10场各项赛事，皇马取得了6胜4平的不败战绩，虽说未尝败绩，但也是没能拿下赛事，状态算是有些许下滑，好在球队并无出现主力球员伤停，轮换阵容完整，且球队的进攻也是走稳，近15场各项赛事场均能打入2.2球，防守端近10场也仅丢失了9球，可谓是攻防俱佳。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"673b3ec1-185c-4f20-a2f7-43c26b1567ee\\\">从整体实力而言，皇马对马洛卡构成碾压态势；从两队过往交锋记录来看，皇马近10次交手马洛卡8胜2负，也是占尽优势。所以，只要皇马本场打出正常水平，拿下马洛卡应该是稳操胜券。下面简单预测一下皇马本场可能会排出的首发阵容。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">门将位置上，自然还是卢宁镇守皇马球门；后防线上，不出意外，安帅会继续祭出他惯用的4后卫阵型，大概率获得首发的4名后防大将会是费兰-门迪、吕迪格、米利唐以及卡瓦哈尔。其中，伤愈复出的米利唐和吕迪格组成双中卫组合；而费兰-门迪和卡瓦哈尔则会一左一右出任边后卫。巴西铁卫米利唐能否满血回归？无疑是本场的一大看点。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">中场方面，毫无疑问，坐镇皇马中后场负责拦截抢断的主力后腰依旧会是德国老将托尼-克罗斯；而和托尼-克罗斯搭档组成双后腰组合的则应该会是法国小妖卡马文加。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">在两位后腰身前，应该会是功勋队长莫德里奇坐镇前场出任进攻指挥官，主导球队的前场攻势；在他身边形成策应的两位边路悍将应该会是卜拉欣-迪亚斯和罗德里戈。英格兰中场帝星贝林厄姆、楚阿梅尼则大概率会得到轮换，替补待命。</span></p><p><br></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"81356360-32da-47a6-929d-2e80686df81d\\\">前锋线上，不出意外，小熊维尼修斯会一马当先冲在前面为皇马冲锋陷阵，负责摧城拔寨。所以，</span></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><br></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"81356360-32da-47a6-929d-2e80686df81d\\\">最后预计皇马本场对阵马洛卡的最终首发11人是：卢宁；费兰-门迪、吕迪格、米利唐、卡瓦哈尔；托尼-克罗斯、卡马文加；卜拉欣-迪亚斯、莫德里奇、罗德里戈；维尼修斯</span></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><br></p><p><span style=\\\"font-size: 16px;\\\">预测马洛卡vs皇家马德里首发：</span></p><p><span style=\\\"font-size: 16px;\\\">马洛卡：拉伊科维奇；拉托、纳斯塔西奇、吉奥瓦尼-冈萨雷斯、马菲奥；莱略、达尼-罗德里格斯、莫尔莱内斯、科斯塔、桑切斯；穆里奇</span></p>\",\"articleId\":null,\"articleTittle\":\"伯恩茅斯vs曼联：红魔无中卫可用，做客难啃樱桃？\",\"authorName\":\"小王子\",\"categoryName\":\"赛事前瞻\",\"count\":3,\"excludeIds\":null,\"id\":\"268124\",\"matchDetail\":\"\",\"matchId\":null,\"readCounts\":\"15226\",\"showTime\":\"1713001873924\",\"sportId\":\"1\",\"summary\":\"<p data-sider-select-id=\\\"3bb613fe-420d-43c9-96f9-6912cd75e1d8\\\"><span style=\\\"font-size: 16px;\\\" data-s\",\"tagColor\":\"#DC0202\",\"tagName\":\"英超前瞻\",\"thumbnails\":\"group1/M00/31/62/CgURt2YaVViABOq0AAR0FhM7Sf0206.png\",\"updateTime\":\"1713001873924\"},{\"articleContent\":\"<p data-sider-select-id=\\\"57baed4d-ebf9-419f-a9a6-cce68eed0e4e\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"2cde4b71-4a14-4ead-9a4a-79f5ed5a109b\\\">西班牙甲级联赛，马洛卡VS皇家马德里。</span></p><p data-sider-select-id=\\\"57baed4d-ebf9-419f-a9a6-cce68eed0e4e\\\"><img src=\\\"IMAGE_DOMAIN_YUNYING_PLACEHOLDER/group1/M00/31/5F/CgURt2YaLZeAN_SLAAgfT44ZSIc777.png\\\"></p><p><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"d0734e51-2857-4117-8573-aca906de6a2f\\\">马洛卡西甲中下游球队，本赛季状态较为低迷，在经历了30轮联赛过后，球队仅仅取得了6胜13平11负积31分，排在联赛第15位，虽然目前离降级区差了6分，球队还是要努力争取拿分，近期的马洛卡状态不佳，上一场国王杯1-1战平毕尔巴鄂竞技，近10场各项赛事仅3胜5派2负，进攻端也只打入了8粒球，场均进球不到1粒，好在防守端只丢失了7球，且有4场零封对手，防守还算尚可，值得一提的是，马洛卡主场作战能力有所提升，近10个赛事主场6胜2平2负，胜率多达6成。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">皇马西甲豪门顶级球队，目前是以23胜6平1负积75分的战绩，排在西甲榜首，领先第2的巴萨8个积分，就球队目前的状态来看，最后几场联赛，应该是能拿下联赛冠军的，在上场欧冠主场战平曼城，没有拿到优势，还是非常可惜的，近10场各项赛事，皇马取得了6胜4平的不败战绩，虽说未尝败绩，但也是没能拿下赛事，状态算是有些许下滑，好在球队并无出现主力球员伤停，轮换阵容完整，且球队的进攻也是走稳，近15场各项赛事场均能打入2.2球，防守端近10场也仅丢失了9球，可谓是攻防俱佳。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"673b3ec1-185c-4f20-a2f7-43c26b1567ee\\\">从整体实力而言，皇马对马洛卡构成碾压态势；从两队过往交锋记录来看，皇马近10次交手马洛卡8胜2负，也是占尽优势。所以，只要皇马本场打出正常水平，拿下马洛卡应该是稳操胜券。下面简单预测一下皇马本场可能会排出的首发阵容。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">门将位置上，自然还是卢宁镇守皇马球门；后防线上，不出意外，安帅会继续祭出他惯用的4后卫阵型，大概率获得首发的4名后防大将会是费兰-门迪、吕迪格、米利唐以及卡瓦哈尔。其中，伤愈复出的米利唐和吕迪格组成双中卫组合；而费兰-门迪和卡瓦哈尔则会一左一右出任边后卫。巴西铁卫米利唐能否满血回归？无疑是本场的一大看点。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">中场方面，毫无疑问，坐镇皇马中后场负责拦截抢断的主力后腰依旧会是德国老将托尼-克罗斯；而和托尼-克罗斯搭档组成双后腰组合的则应该会是法国小妖卡马文加。</span></p><p><br></p><p><span style=\\\"font-size: 16px;\\\">在两位后腰身前，应该会是功勋队长莫德里奇坐镇前场出任进攻指挥官，主导球队的前场攻势；在他身边形成策应的两位边路悍将应该会是卜拉欣-迪亚斯和罗德里戈。英格兰中场帝星贝林厄姆、楚阿梅尼则大概率会得到轮换，替补待命。</span></p><p><br></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"81356360-32da-47a6-929d-2e80686df81d\\\">前锋线上，不出意外，小熊维尼修斯会一马当先冲在前面为皇马冲锋陷阵，负责摧城拔寨。所以，</span></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><br></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><span style=\\\"font-size: 16px;\\\" data-sider-select-id=\\\"81356360-32da-47a6-929d-2e80686df81d\\\">最后预计皇马本场对阵马洛卡的最终首发11人是：卢宁；费兰-门迪、吕迪格、米利唐、卡瓦哈尔；托尼-克罗斯、卡马文加；卜拉欣-迪亚斯、莫德里奇、罗德里戈；维尼修斯</span></p><p data-sider-select-id=\\\"b9b74b19-2d91-4005-85c2-107ae7238a48\\\"><br></p><p><span style=\\\"font-size: 16px;\\\">预测马洛卡vs皇家马德里首发：</span></p><p><span style=\\\"font-size: 16px;\\\">马洛卡：拉伊科维奇；拉托、纳斯塔西奇、吉奥瓦尼-冈萨雷斯、马菲奥；莱略、达尼-罗德里格斯、莫尔莱内斯、科斯塔、桑切斯；穆里奇</span></p>\",\"articleId\":null,\"articleTittle\":\"布伦特福德能否主场终结连败颓势，击退垫底的谢菲尔德联？\",\"authorName\":\"小王子\",\"categoryName\":\"赛事前瞻\",\"count\":3,\"excludeIds\":null,\"id\":\"268123\",\"matchDetail\":\"\",\"matchId\":null,\"readCounts\":\"5607\",\"showTime\":\"1713001383635\",\"sportId\":\"1\",\"summary\":\"<p data-sider-select-id=\\\"d2480035-613f-4f26-ba66-d41ea3404d01\\\"><span style=\\\"font-size: 16px;\\\" data-s\",\"tagColor\":\"#DC0202\",\"tagName\":\"英超前瞻\",\"thumbnails\":\"group1/M00/31/61/CgURtWYaU3eAA_EtAAlnKKoSY7E068.png\",\"updateTime\":\"1713001383635\"},{\"articleContent\":\"\",\"articleId\":null,\"articleTittle\":\"诺丁汉森林迎战狼队：双方都防守一团糟，谁能更胜一筹？\",\"authorName\":\"小王子\",\"categoryName\":\"赛事前瞻\",\"count\":3,\"excludeIds\":null,\"id\":\"268109\",\"matchDetail\":\"\",\"matchId\":null,\"readCounts\":\"7140\",\"showTime\":\"1713000995388\",\"sportId\":\"1\",\"summary\":\"<p data-sider-select-id=\\\"c637da51-b66d-4ac4-aeae-81998e7cc80a\\\"><span style=\\\"font-size: 16px;\\\" data-s\",\"tagColor\":\"#DC0202\",\"tagName\":\"英超前瞻\",\"thumbnails\":\"group1/M00/31/61/CgURtmYaUfeAehx2AAnnM9syk4M485.png\",\"updateTime\":\"1713000995388\"}]";
      List<AnalyzeNewsEntity> dataList = (jsonDecode(data) as List)
          .map((e) => AnalyzeNewsEntity.fromJson(e))
          .toList();
      dataList.forEach((element) {
        element.showTime =
            "${RelativeDateFormat.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(element?.showTime ?? "0") * 1000))}";
      });
      state.analyzeFavoriteArticleList.value = dataList;
      update(["analyzeList", "analyzeNewsComponentBuilder"]);
      update(["buildGuessBtn"]);
    });

    //  测试代码
    Future.delayed(Duration(seconds: 8), () {
      String data = Test.data;
      AnalyzeNewsEntity dataList = AnalyzeNewsEntity.fromJson(jsonDecode(data));
      dataList.showTime =
          "${RelativeDateFormat.format(DateTime.fromMicrosecondsSinceEpoch(int.parse(dataList?.showTime ?? "0") * 1000))}";
      state.analyzeNewsEntity.value = dataList;
      if (dataList == null) {
        noData = true;
      } else {
        noData = false;
      }
      update(["analyzeNewsComponentBuilder"]);
    });
  }

  void loadNewArticle(AnalyzeNewsEntity analyzeFavoriteArticleList) async {
    print("=========>点击 ${analyzeFavoriteArticleList.toJson()}");

    Get.bottomSheet(
        isScrollControlled: true,
        AnalyzeNewsDialog(analyzeFavoriteArticleList));
    // requestGetArticle(mid: analyzeFavoriteArticleList.id??"",type: "2");
    //
    // update(["analyzeList","analyzeNewsComponentBuilder"]);
    // update(["buildGuessBtn","buildMeassgeBody"]);
  }
}
