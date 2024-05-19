import 'package:flutter/cupertino.dart';
import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/analyze_battle_array/widget/analyze_child_item.dart';
import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/widget/data/bottom_message_conpoment.dart';
import 'package:flutter_ty_app/app/modules/match_detail/extension/theme_extension.dart';
import 'package:flutter_ty_app/app/modules/match_detail/widgets/container/analysis/item/analyze_divider.dart';
import 'package:flutter_ty_app/app/modules/match_detail/widgets/container/analysis/item/item_header_widget.dart';
import 'package:flutter_ty_app/app/modules/match_detail/widgets/container/analysis/item/text_no_data.dart';

import '../../../../../../../generated/locales.g.dart';
import '../../../../../../services/models/res/analyze_array_person_entity.dart';
import '../../../../../login/login_head_import.dart';
import '../../widget/data/nodata_text_view.dart';
import '../analyze_battle_array_logic.dart';
import '../analyze_battle_arrayinfo_logic.dart';
import '../widget/analyze_battle_array_head.dart';
import '../widget/analyze_battle_arrayinfo_head.dart';

class AnalyzeChild2ArrayInfoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AnalyzeBattleArrayInfoLogic>(
        id: "analyzeChildArrayInfoComponent2",
        builder: (controller) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnalyzeBattleArrayInfoHead(),
                Card(
                  color: Get.theme.tabPanelBackgroundColor,
                  child: Container(
                    color: Get.theme.tabPanelBackgroundColor,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        AnalyzeDivider(),
                        ItemHeaderWidget(
                          name:   '${LocaleKeys.analysis_football_matches_starting_lineup.tr}${controller.state.analyzeArrayInfoPersonEntity2.value.homeFormation ?? ""}',
                        ),
                        AnalyzeDivider(),
                        buildBody(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        AnalyzeDivider(),
        buildHead(),
        AnalyzeDivider(),
        buildList(),
        SizedBox(
          height: 14.w,
        ),
        ItemHeaderWidget(
          name: LocaleKeys.analysis_football_matches_bench_lineup.tr,
        ),
        buildHead(),
        buildList1(),
        // //BottomMessageConpoment()
      ],
    );

  }

  buildHead() {
    return Container(
      height: 24.w,
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
          ),
          Container(
            width: 60.w,
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.analysis_football_matches_position.tr,
              style: TextStyle(color: Color(0xFF949AB6), fontSize: 10.sp),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                LocaleKeys.analysis_football_matches_name.tr,
                style: TextStyle(color: Color(0xFF949AB6), fontSize: 10.sp),
              ),
            ),
          ),
          Container(
            width: 60.w,
            alignment: Alignment.center,
            child: Text(
              LocaleKeys.analysis_football_matches_number.tr,
              style: TextStyle(color: Color(0xFF949AB6), fontSize: 10.sp),
            ),
          ),
        ],
      ),
    );
  }

  buildList1() {
    return GetBuilder<AnalyzeBattleArrayInfoLogic>(
        id:"buildList2" ,
        builder: (controller){
          return Column(
            children: [
              AnalyzeDivider(),
              ( controller.state.analyzeArrayInfoPersonEntity2.value.down==null||controller.state.analyzeArrayInfoPersonEntity2.value.down?.isEmpty ==
                  true)

                  ?TextNoData(): Container(
                /// 最小高度单个item的高度
                constraints: BoxConstraints(maxHeight: 520.h, minHeight: 100.h),
                color: Colors.white,
                child: ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 14.w),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.state.analyzeArrayInfoPersonEntity2.value.down?.length??0,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),

                  //列表项构造器
                  itemBuilder: (BuildContext context, int index) {
                    return  AnalyzeChildItem(controller.state.analyzeArrayInfoPersonEntity2.value.down?[index]??Up());
                  },
                  //分割器构造器
                  separatorBuilder: (BuildContext context, int index) {
                    return AnalyzeDivider(

                    );
                  },
                ),
              )
            ],
          );;
        });




  }

  buildList() {
    return GetBuilder<AnalyzeBattleArrayInfoLogic>(
        id:"buildList2" ,
        builder: (controller){
          return
            ( controller.state.analyzeArrayInfoPersonEntity2.value.up==null||controller.state.analyzeArrayInfoPersonEntity2.value.up?.isEmpty ==
              true)
              ?TextNoData(): Container(
            /// 最小高度单个item的高度
            constraints: BoxConstraints(maxHeight: 520.h, minHeight: 100.h),
            color: Colors.white,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 14.w),
              scrollDirection: Axis.vertical,
              itemCount: controller.state.analyzeArrayInfoPersonEntity2.value.up?.length??0,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),

              //列表项构造器
              itemBuilder: (BuildContext context, int index) {
                return   AnalyzeChildItem(controller.state.analyzeArrayInfoPersonEntity2.value.up?[index]??Up());
              },
              //分割器构造器
              separatorBuilder: (BuildContext context, int index) {
                return AnalyzeDivider(

                );
              },
            ),
          );
        });


  }
}
