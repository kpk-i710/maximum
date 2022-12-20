import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/promotions/level_below/promotions_list_page_controller.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../../../widgets/news_widgets/news_grid_item_widget.dart';
import '../../../widgets/promotions_widgets/promotions_grid_item_widget.dart';
import '../../../widgets/search_widgets/search_bar_2.dart';
import '../../news/level_below/level_below/page_news.dart';
import 'level_below/page_promotions.dart';

class PromotionsListPage extends StatelessWidget {
  PromotionsListPage({Key? key}) : super(key: key);

  final promotionsListPageController = Get.put(PromotionsListPageController());
  final height = 180.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar2(
          title: promotionsListPageController.poromotionsList?.news.naim ?? ""),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: promotionsListPageController.tabSelect),
      body: Obx(() {
        return Visibility(
          visible: promotionsListPageController.isLoaded.value,
          child: ListView.builder(
              itemCount: promotionsListPageController
                  .poromotionsList?.result[0][0].length,
              itemBuilder: (context, index) {
                return PromotionsGridItemWidget(
                  onPress: () {
                    Get.to(
                        PagePromotions(
                          result: promotionsListPageController
                              .poromotionsList?.result[0][0][index],
                        ),
                        arguments: {
                          "title": promotionsListPageController
                              .poromotionsList?.result[0][0][index].naim,
                        });
                  },
                  result: promotionsListPageController
                      .poromotionsList?.result[0][0][index],
                );
              }),
          replacement: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }

  String? getImage(String? image) {
    print(image);
    return image;
  }
}
