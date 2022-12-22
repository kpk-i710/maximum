import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../widgets/discount_widgets/discount_detail_item_widget.dart';

import '../../../../widgets/search_widgets/search_bar_2.dart';
import '../../../../widgets/widgets.dart' as widgets;

import '../../discount_card_page.dart';

import 'discount_page_list_view_controller.dart';

class DiscountPageListView extends StatelessWidget {
  final controller = Get.put(DiscountPageNewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      appBar: SearchBar2(title: Get.arguments['title']??""),
      body: SafeArea(
        child: Obx(() {
          return Visibility(
            visible: controller.isLoaded.value,
            child: ListView.separated(
                itemCount: controller.dicount_list?.product[0].length??0,
                itemBuilder: (context, index) {
                  return DiscountDetailItemWidget(
                    product: controller.dicount_list?.product[0][index],
                    onPress: () {
                      print(controller.dicount_list?.product[0][index].naim);
                      Get.to(() => DiscountCardPage(product: controller.dicount_list?.product[0][index],
                      ),arguments: {
                        "title": controller.dicount_list?.product[0][index].naim,
                      });
                    },
                  );

                },   separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },),

            replacement: Center(child: CircularProgressIndicator()),
          );
        }),
      ),
    );
  }
}
