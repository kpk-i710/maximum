import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/product_widgets/products_list_widget.dart';

import '../../helpers/app_router.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../styles.dart';
import '../../widgets/discount_widgets/discount_widget.dart';
import '../../widgets/filter_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import 'discount_page_controller.dart';

class DiscountPage extends StatelessWidget {
  final c = Get.put(DiscountPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      appBar: SearchBar2(title: 'discounts'.tr),
      bottomNavigationBar:
          widgets.bottomNavigation(currentTab: 0, onSelectTab: c.tabSelect),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: c.onRefresh,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(height: 2),
                FilterWidget(
                  onFilterTap: () async {
                    final res = await Get.toNamed(AppRouter.filter);
                    print('result from filter $res');
                  },
                  onSortTap: () {
                    widgets.getSortSheet();
                  },
                  callBack: (type) {},
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Obx(() => DiscountWidget(discount: c.discount)),
                      const SizedBox(height: 10),
                      Text(
                        'until_the_end_of_discount'.tr,
                        style: AppTextStyles.mPlusRounded1c(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            if (c.discount.shortDescription != null)
                              Html(
                                data: '${c.discount.shortDescription}',
                              ).marginOnly(bottom: 20),
                            if (c.discount.description != null)
                              Html(data: '${c.discount.description}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Obx(() {
                  if (c.discount.products != null)
                    return ProductsListWidget(
                      list: c.discount.products,
                    );

                  return const SizedBox();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
