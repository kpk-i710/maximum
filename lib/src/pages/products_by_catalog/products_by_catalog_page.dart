import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_grid_widget.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/discount_widgets/discount_detail_item_widget.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/filter_widget.dart';
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
              (BuildContext context, bool innerBoxIsScrolled) =>
                  [widgets.appBarFloating(title: Get.arguments['title'])],
          body: Stack(
            children: [
              SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Obx(() {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: 50),
                        Obx(() => BannerWidget(
                              list: homeController.bannerList.value,
                              margin: EdgeInsets.only(top: 0),
                            )),
                        const SizedBox(height: 10),
                        widgets
                            .titleWidget(title: 'bestsellers'.tr)
                            .paddingSymmetric(horizontal: 10),
                        Obx(() => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: BoughtTodayGridWidget(
                                list: homeController.discountList.value,
                              ),
                            )),
                        if (widgetController.currentVersionCatalog.value == 0)
                          Column(
                            children: [
                              for (int i = 0; i < 20; i++)
                                Column(
                                  children: [
                                    SizedBox(height: 10),
                                    DiscountDetailItemWidget(
                                      onPress: () {},
                                    )
                                    // ProductListItemWidget(),
                                  ],
                                ),
                            ],
                          ),
                        if (widgetController.currentVersionCatalog.value == 1)
                          Column(
                            children: [
                              for (int i = 0; i < 20; i++)
                                ProductBlockItemWidget(),
                            ],
                          ),
                        if (widgetController.currentVersionCatalog.value == 2)
                          Column(
                            children: [
                              for (int i = 0; i < 20; i++)
                                Column(
                                  children: [
                                    Obx(() => PopularGoodsGridWidget(
                                          list:
                                              homeController.discountList.value,
                                        )),
                                  ],
                                ).paddingSymmetric(horizontal: 10),
                            ],
                          ),
                        const SizedBox(height: 20),
                      ],
                    );
                  })),
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
        ),
      ),
    );
  }
}
