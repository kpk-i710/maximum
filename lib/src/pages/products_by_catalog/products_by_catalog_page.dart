import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/products_by_catalog/products_by_catalog_page_controller.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_grid_widget.dart';
import 'package:maxkgapp/src/widgets/news_widgets/news_grid_item_widget.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/product_widgets/product_hight_item_widget.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../home/home_page_controller.dart';



class ProductsByCatalogPage extends ConsumerWidget {
  final homeController = Get.put(HomePageController());
  final widgetController = Get.put(WidgetsControllers());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(currentVersionCatalog);

    final future = ref.watch(catalogProvider(0));
    return Scaffold(
      bottomNavigationBar: widgets.newBottomNavigation(
        currentTab: 0,
      ),
      body: SafeArea(
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            widgets.appBarFloating(
                title: Get.arguments != null ? Get.arguments['title'] : "")
          ],
          body: future.when(
              data: (data) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (currentVersion == 0)
                        showList(
                            bottomWidget: NewsGridItemWidget(
                          onPress: () {},
                        )),
                      if (currentVersion == 1)
                        showList(bottomWidget: ProductBlockItemWidget()),
                      if (currentVersion == 2)
                        showList(
                            separator: 0,
                            bottomWidget: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: PopularGoodsGridWidget(
                                list: homeController.discountList.value,
                              ),
                            )),
                    ],
                  ),
              error: (error, stack) => Center(child: Text("$error")),
              loading: () => Center(child: CircularProgressIndicator())),
        ),
      ),
    );
  }

  Widget showList({required Widget bottomWidget, double separator = 10}) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          if (index == 0)
            return firstLine(
              bottomWidget: bottomWidget,
            );
          return bottomWidget;
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: separator);
        },
        itemCount: 30,
      ),
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
