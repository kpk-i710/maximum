import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                // const SizedBox(height: 25),
                // Obx(() => BannerWidget(list: controller.bannerList.value)),
                // const SizedBox(height: 5),
                // Obx(() => CatalogGridWidget(
                //       list: controller.catalogList.value,
                //       heroTag: 'Catalog_',
                //     )).paddingSymmetric(horizontal: 12),
                // const Divider(),
                // widgets
                //     .titleWidget('bestsellers'.tr)
                //     .paddingSymmetric(horizontal: 12),
                // Obx(() => ProductsCarouselWidget(
                //       list: controller.bestsellerProductsList.value,
                //
                //     )),

                const Divider(),
                const SizedBox(height: 10),
                Obx(() => BannerWidget(
                      list: homeController.bannerList.value,
                      margin: EdgeInsets.only(top: 0),
                    )),
                widgets
                    .titleWidget(title:'bestsellers'.tr)
                    .paddingSymmetric(horizontal: 12),
                BestsellersCarouselWidget(),
                Container(
                  child: Obx(() => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 1000),
                        child: controller.productsViewType.value == 'grid'
                            ? ProductsGridWidget(
                                list: controller.productsList.value,
                                key: UniqueKey(),
                              )
                            : controller.productsViewType.value == 'list'
                                ? ProductsListWidget(
                                    key: UniqueKey(),
                                    list: controller.productsList.value,
                                    heroTag: 'product_list_')
                                : ProductsBlockListWidget(
                                    key: UniqueKey(),
                                    list: controller.productsList.value,
                                    heroTag: 'product_block_'),
                      )),
                ),
                const SizedBox(height: 90),
                widgets.supportCenterButton().paddingSymmetric(horizontal: 12),
                const SizedBox(height: 20),
              ],
            )),
      )),
    );
  }
}
