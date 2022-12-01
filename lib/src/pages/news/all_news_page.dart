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
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
            itemCount: allNewsController.newsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRouter.listNews,
                      arguments: {
                        "idNews": allNewsController.newsList[index].id,
                      },
                    );
                  },
                  child: widgets
                      .newsItemWidget(allNewsController.newsList[index].logoUrl!)
                      .marginOnly(bottom: 20),
                ),
              );
            }),
      ),
    );
  }
}
