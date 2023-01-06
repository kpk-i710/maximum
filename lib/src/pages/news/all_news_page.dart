import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';

import '../../helpers/app_router.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../widgets/widgets.dart' as widgets;
import 'all_news_controller.dart';

class AllNewsPage extends StatelessWidget {
  const AllNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allNewsController = Get.put(AllNewsController());
    return Scaffold(
      appBar: SearchBar2(title: "news".tr),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: allNewsController.tabSelect),
      backgroundColor: Colors.white,
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: ListView.builder(
              itemCount: allNewsController.newsList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRouter.betweenAllPage,
                      arguments: {
                        "idNews": allNewsController.newsList[index].id,
                      },
                    );
                  },
                  child: widgets
                      .newsItemWidget(allNewsController.newsList[index])
                      .marginOnly(bottom: 20),
                );
              }),
        ),
      ),
    );
  }
}
