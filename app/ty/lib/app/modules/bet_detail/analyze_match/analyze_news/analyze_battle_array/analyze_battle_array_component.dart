import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/analyze_battle_array/child/analyze_child2_array_component.dart';
import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/analyze_battle_array/child/analyze_child_array_component.dart';
import 'package:flutter_ty_app/app/modules/bet_detail/analyze_match/analyze_news/widget/data/data_tab_new.dart';
import 'package:get/get.dart';

import 'analyze_battle_array_logic.dart';

class AnalyzeBattleArrayComponent extends StatelessWidget {
  String? fromTab;
  AnalyzeBattleArrayComponent({Key? key}) : super(key: key);
  final logic = Get.put(AnalyzeBattleArrayLogic());
  final state = Get.find<AnalyzeBattleArrayLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTab(),
          Expanded(
            child: TabBarView(
              controller: logic.tabController,
              children: [
                AnalyzeChildArrayComponent(),
                AnalyzeChildArrayComponent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildTab() {
    List<String> _tabs = logic.state.teamsNames.value;
    return AnalyzeTabbarNew(
      key:logic.mSTabbarDemo1StateKey,
      _tabs,
      (page) {},
      logic.tabController,
      widgetWidth: 280.w,
    );
  }


}
