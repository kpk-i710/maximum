import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/banner_widget.dart';
import '../../widgets/product_widgets/products_grid_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../home/home_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class BestSellersListPage extends StatelessWidget {
  const BestSellersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomePageController());
    return Scaffold(
      appBar: SearchBar2(title: "Бестселлеры"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 19),
            Obx(() => BannerWidget(list: homeController.bannerList.value)),
            SizedBox(height: 10),
            widgets
                .titleWidget(title: 'bestsellers'.tr)
                .paddingSymmetric(horizontal: 12),
            SizedBox(height: 20),
            Obx(() => ProductsGridWidget(
                  list: homeController.bestsellerProductsList.value,
                )).paddingSymmetric(horizontal: 12),

            Obx(() => BannerWidget(list: homeController.bannerList.value)),
            SizedBox(height: 40),

          ],
        ),
      ),
    );
  }
}
