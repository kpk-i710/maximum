import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/news/level_below/news_list_page_controller.dart';
import 'package:maxkgapp/src/widgets/news_widgets/news_grid_item_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';

import '../../helpers/app_router.dart';
import '../../widgets/bestsellers/bestsellers_carousel_widget.dart';
import '../../widgets/bestsellers/bestsellers_widget.dart';
import '../../widgets/product_widgets/product_list_item_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../widgets/product_widgets/products_carousel_widget.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/filter_widget.dart';
import '../../widgets/product_widgets/products_block_list_widget.dart';
import '../../widgets/product_widgets/products_grid_widget.dart';
import '../../widgets/product_widgets/products_list_widget.dart';
import '../../widgets/widgets.dart' as widgets;

import '../catalog/catalog_page_controller.dart';
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
          child: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilterWidget(onFilterTap: () async {
                  final res = await Get.toNamed(AppRouter.profile);
                }, callBack: (type) {
                  controller.changeViewType(type);
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
                BestsellersCarouselWidget(),
                ProductListItemWidget(),
                SizedBox(height: 10),
                ProductListItemWidget(),
                ProductBlockItemWidget(),
                const SizedBox(height: 20),
              ],
            )),
      )),
    );
  }
}
