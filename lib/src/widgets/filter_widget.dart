import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/products_by_catalog/products_by_catalog_page_controller.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';

import '../styles.dart';

import 'app_icon.dart';
import '../widgets/widgets.dart' as widgets;

class FilterWidget extends StatelessWidget {
  final Function(String val)? callBack;
  final Function()? onFilterTap;
  final Function()? onSortTap;

  FilterWidget({this.callBack, this.onFilterTap, this.onSortTap});

  final controller = Get.put(ProductsByCatalogPageController());
  final widgetController = Get.put(WidgetsControllers());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(color: Colors.grey.shade200, width: 1))),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: InkWell(
              onTap: onSortTap,
              child: Row(
                children: [
                  AppIcon(AppIcons.sort, color: AppTextStyles.colorBlueMy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'sorting'.tr,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.roboto(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                        Obx(() {
                          return Text(
                            widgetController
                                .sorts[
                                    widgetController.selectedRadioFilter.value]
                                .title,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.roboto(
                                color: Colors.black.withAlpha(80),
                                fontSize: 10),
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: InkWell(
              onTap: onFilterTap,
              child: Row(
                children: [
                  AppIcon(AppIcons.filter, color: AppTextStyles.colorBlueMy),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('filter'.tr,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.roboto(
                                fontSize: 14, fontWeight: FontWeight.w500)),
                        Text('found_products'.trParams({'count': '467'})!,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.roboto(
                                color: Colors.black.withAlpha(80),
                                fontSize: 10))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => InkWell(
                    onTap: () {
                      if (widgetController.currentVersionCatalog.value < 2) {
                        widgetController.currentVersionCatalog.value =
                            widgetController.currentVersionCatalog.value + 1;
                      } else {
                        widgetController.currentVersionCatalog.value = 0;
                      }
                      widgetController.setIcon(
                          widgetController.currentVersionCatalog.value);
                    },
                    child: widgetController.icon.value)),
                const SizedBox(width: 10),
                widgets.share(color: AppTextStyles.colorBlueMy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
