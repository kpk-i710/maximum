import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/discount_widgets/discount_detail_item_widget.dart';
import '../../widgets/product_widgets/favorite_products_grid_widget.dart';
import '../../widgets/product_widgets/products_block_list_widget.dart';
import '../../widgets/product_widgets/products_list_widget.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../pages/favorite/favorite_page_controller.dart';
import '../../widgets/filter_widget.dart';
import '../../styles.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../discounts/discount_card_page.dart';
import '../discounts/discount_list_page/discount_page_list_view/discount_page_list_view_controller.dart';

class FavoritePage extends StatelessWidget {
  final controller = Get.put(FavoritePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchBar2(title: "favorite".tr),
      body: SafeArea(
        child: Obx(() {
          return controller.isLoaded.value
              ? ListView.builder(
                  itemCount: controller.dicount_list?.product[0].length,
                  itemBuilder: (context, index) {
                    return DiscountDetailItemWidget(
                      product: controller.dicount_list?.product[0][index],
                      onPress: () {
                        print(controller.dicount_list?.product[0][index].naim);
                        Get.to(
                            () => DiscountCardPage(
                                  product: controller.dicount_list?.product[0]
                                      [index],
                                ),
                            arguments: {
                              "title": controller
                                  .dicount_list?.product[0][index].naim,
                            });
                      },
                    );
                  })
              : Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
