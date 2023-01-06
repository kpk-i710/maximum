import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/models/news_list.dart';
import 'package:maxkgapp/src/pages/filter/filter_page_controller.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_detail_item_widget.dart';
import 'package:maxkgapp/src/widgets/filter_widget.dart';
import 'package:maxkgapp/src/widgets/popular_categories/popular_categories_item.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';

import '../../widgets/news_widgets/news_grid_item_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import 'bewtween_all_pages_controller.dart';
import '../detail_all/detail_all.dart';
import '../../widgets/widgets.dart' as widgets;

class BetweenAllPages extends StatelessWidget {
  BetweenAllPages({Key? key,   this.title}) : super(key: key);

  final newsListPageController = Get.put(BetweenAllPagesController());
  final height = 180.0;
  final widgetController = Get.put(WidgetsControllers());
  final homeController = Get.put(HomePageController());
  final controller = Get.put(FilterPageController());

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: newsListPageController.tabSelect),
      body: SafeArea(
        child: Obx(() {
          return newsListPageController.isLoaded.value
              ? NestedScrollView(
                  floatHeaderSlivers: true,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) => [
                    widgets.appBarFloating(
                        title: title ?? "")
                  ],
                  body: Stack(
                    children: [
                      ListView.separated(
                        itemCount: newsListPageController
                                .newsList?.result[0][0].length ??
                            0,
                        itemBuilder: (context, index) {
                          if (index == 0) return widgets.newsHtml();

                          return getCurrentContainer(index: index);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10);
                        },
                      ),
                      FilterWidget(
                          onFilterTap: () async {
                            Get.toNamed(AppRouter.filter);
                          },
                          onSortTap: () {
                            widgets.getSortSheet();
                          },
                          callBack: (type) {}),
                    ],
                  ),
                )
              : Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }

  getCurrentContainer({required int index}) {
    return Obx(() {
      return Column(
        children: [
          if (widgetController.currentVersionCatalog.value == 0)
            Container(
              child: NewsGridItemWidget(
                index: index,
                onPress: () {
                  goToDetail(index: index);
                },
                result: newsListPageController.newsList?.result[0][0][index],
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
    final product = newsListPageController.newsList?.result[0][0][index];
    Get.to(
        () => DetailAll(
              idPost: product?.idPost,
              img: product?.img,
              price: product?.price,
              naim: product?.naim,
            ),
        arguments: {
          "title":
              newsListPageController.newsList?.result[0][0][index].naim ?? "",
        });
  }

  String? getImage(String? image) {
    print(image);
    return image;
  }
}
