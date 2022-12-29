import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_grid_widget.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import '../../helpers/app_router.dart';
import '../../widgets/product_widgets/product_list_item_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/filter_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../home/home_page_controller.dart';
import 'products_by_catalog_page_controller.dart';

class ProductsByCatalogPage extends StatelessWidget {
  final controller = Get.put(ProductsByCatalogPageController());
  final homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar2(title: Get.arguments['title'] ?? ""),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      body: SafeArea(
          child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FilterWidget(onFilterTap: () async {
                    final res = await Get.toNamed(AppRouter.profile);
                  }, callBack: (type) {

                  }),
                  const SizedBox(height: 10),
                  Obx(() => BannerWidget(
                    list: homeController.bannerList.value,
                    margin: EdgeInsets.only(top: 0),
                  )),
                  const SizedBox(height: 10),
                  widgets
                      .titleWidget(title: 'bestsellers'.tr)
                      .paddingSymmetric(horizontal: 10),
                  Obx(() => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: BoughtTodayGridWidget(
                      list: homeController.discountList.value,
                    ),
                  )),
                  SizedBox(height: 5),
                  ProductListItemWidget(),
                  SizedBox(height: 10),
                  ProductListItemWidget(),
                  ProductBlockItemWidget(),
                  Column(
                    children: [
                      
                      Obx(() => PopularGoodsGridWidget(
                        list: homeController.discountList.value,
                      )),
                    ],
                  ).paddingSymmetric(horizontal: 10),
                  const SizedBox(height: 20),
                ],
              )),),
    );
  }
}
