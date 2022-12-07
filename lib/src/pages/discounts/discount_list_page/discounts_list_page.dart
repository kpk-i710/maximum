import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/app_router.dart';
import '../../../widgets/search_widgets/search_bar_2.dart';
import '../../../widgets/discount_widgets/discount_list_widget.dart';
import '../../../widgets/filter_widget.dart';
import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../discount_list_page_controller.dart';

class DiscountsListPage extends StatelessWidget {
  final DiscountController = Get.put(DiscountsListPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      appBar: SearchBar2(title: 'discounts'.tr),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: DiscountController.tabSelect),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: DiscountController.onRefresh,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                // FilterWidget(
                //     onFilterTap: () async {
                //       final res = await Get.toNamed('/filter');
                //       print('result from filter $res');
                //     },
                //     callBack: (type) {},
                // ),
                SizedBox(height: 10),
                Obx(() => DiscountListWidget(
                    list: DiscountController.discountList.value,
                    onItemTap: (index) {
                      Get.toNamed(
                        AppRouter.discount,
                        // arguments: DiscountController.discountList[index]
                        arguments: {
                          "idDiscount":
                              DiscountController.discountList[index].id,
                          "title":
                          DiscountController.discountList[index].title,
                        },
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
