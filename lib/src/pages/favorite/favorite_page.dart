import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/discount_widgets/discount_detail_item_widget.dart';

import '../../pages/favorite/favorite_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../widgets/search_widgets/search_bar_2.dart';
import '../discounts/discount_card_page.dart';

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
                      index: index,
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
