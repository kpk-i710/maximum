import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/filter/filter_page_controller.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/news_widgets/news_grid_item_widget.dart';
import 'bewtween_all_pages_controller.dart';
import '../detail_all/detail_all.dart';
import '../../widgets/widgets.dart' as widgets;

class BetweenAllPages extends StatelessWidget {
  BetweenAllPages(
      {Key? key,
      this.title = "",
      this.fromConfigurator = false,
      this.indexConfigurator = 0})
      : super(key: key);

  final betweenAllPageController = Get.put(BetweenAllPagesController());
  final height = 180.0;
  final widgetController = Get.put(WidgetsControllers());
  final homeController = Get.put(HomePageController());
  final controller = Get.put(FilterPageController());

  final String? title;
  final bool fromConfigurator;
  final int indexConfigurator;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        controller.isSearched.value = false;
        return true;
      },
      child: Scaffold(
        bottomNavigationBar: widgets.bottomNavigation(
            currentTab: 0, onSelectTab: betweenAllPageController.tabSelect),
        body: SafeArea(
          child: Obx(() {
            return betweenAllPageController.isLoaded.value
                ? NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) => [
                      controller.isSearched.value
                          ? widgets.appBarSearch()
                          : widgets.appBarFloating(title: title!)
                    ],
                    body: ListView.separated(
                      itemCount: 10 ,
                      itemBuilder: (context, index) {
                        if (index == 0)
                          return Column(
                            children: [
                              widgets.isSearched(),
                              widgets.isFiltered(),
                            ],
                          );
                        return getCurrentContainer(
                            index: index,
                            title: title! +
                                " ${betweenAllPageController.getRandomTitle()}");
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: 10);
                      },
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }

  getCurrentContainer({required int index, required String title}) {
    return Obx(() {
      return Column(
        children: [
          if (widgetController.currentVersionCatalog.value == 0)
            Container(
              child: NewsGridItemWidget(
                title: title,
                indexConfigurator: indexConfigurator,
                price: betweenAllPageController.getRandomTitle(),
                fromConfigurator: fromConfigurator,
                index: index,
                onPress: () {
                  goToDetail(index: index);
                },
              ),
            ),
          if (widgetController.currentVersionCatalog.value == 1)
            GestureDetector(
                onTap: () {
                  goToDetail(index: index);
                },
                child: ProductBlockItemWidget()),
          if (widgetController.currentVersionCatalog.value == 2)
            GestureDetector(
              onTap: () {
                goToDetail(index: index);
              },
              child: PopularGoodsGridWidget(
                list: homeController.discountList.value,
              ).paddingSymmetric(horizontal: 10),
            ),
        ],
      );
    });
  }

  void goToDetail({required int index}) {
    final product = betweenAllPageController.newsList?.result[0][0][index];
    Get.to(
        () => DetailAll(
              idPost: product?.idPost,
              img: product?.img,
              price: product?.price,
              naim: product?.naim,
            ),
        arguments: {
          "title":
              betweenAllPageController.newsList?.result[0][0][index].naim ?? "",
        });
  }

  String? getImage(String? image) {
    print(image);
    return image;
  }
}
