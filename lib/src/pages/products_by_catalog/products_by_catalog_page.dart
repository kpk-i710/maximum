import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_grid_widget.dart';
import 'package:maxkgapp/src/widgets/news_widgets/news_grid_item_widget.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../home/home_page_controller.dart';
import 'products_by_catalog_page_controller.dart';

class ProductsByCatalogPage extends StatelessWidget {
  final controller = Get.put(ProductsByCatalogPageController());
  final homeController = Get.put(HomePageController());
  final widgetController = Get.put(WidgetsControllers());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            widgets.appBarFloating(
                title: Get.arguments != null ? Get.arguments['title'] : "")
          ],
          body: Obx(() {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widgetController.currentVersionCatalog.value == 0)
                  showList(
                      bottomWidget: NewsGridItemWidget(
                    onPress: () {},
                  )),
                if (widgetController.currentVersionCatalog.value == 1)
                  showList(bottomWidget: ProductBlockItemWidget()),
                if (widgetController.currentVersionCatalog.value == 2)
                  showList(
                      bottomWidget: PopularGoodsGridWidget(
                    list: homeController.discountList.value,
                  )),
                const SizedBox(height: 20),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget showList({required Widget bottomWidget}) {
    return Expanded(
      child: ListView.builder(itemBuilder: (context, index) {
        if (index == 0)
          return firstLine(
            bottomWidget: bottomWidget,
          );
        return bottomWidget;
      }),
    );
  }

  Widget firstLine({required Widget bottomWidget}) {
    return Column(
      children: [
        Obx(() => BannerWidget(
              list: homeController.bannerList.value,
              margin: EdgeInsets.only(top: 0),
            )),
        const SizedBox(height: 10),
        widgets
            .titleWidget(title: 'bestsellers'.tr)
            .paddingSymmetric(horizontal: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: BoughtTodayGridWidget(),
        ),
        widgets.isFiltered(),
        SizedBox(height: 10),
        bottomWidget
      ],
    );
  }
}
