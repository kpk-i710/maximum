import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/products_by_catalog/products_by_catalog_page_controller.dart';

import '../styles.dart';

import 'app_icon.dart';

class FilterWidget extends StatelessWidget {
  final icon = MaterialCommunityIcons.view_grid.obs;

  final Function(String val)? callBack;
  final Function()? onFilterTap;

  FilterWidget({this.callBack, this.onFilterTap});

  final controller = Get.put(ProductsByCatalogPageController());

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
            flex: 2,
            child: Row(
              children: [
                AppIcon(AppIcons.sort, color: context.theme.primary),
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
                      Text(
                        'by_rating'.tr,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.roboto(
                            color: Colors.black.withAlpha(80), fontSize: 10),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: InkWell(
              onTap: onFilterTap,
              child: Row(
                children: [
                  AppIcon(AppIcons.filter, color: context.theme.primary),
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
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => InkWell(
                    onTap: () {
                      if (controller.currentVersionCatalog.value < 2) {
                        controller.currentVersionCatalog.value =
                            controller.currentVersionCatalog.value + 1;
                      } else {
                        controller.currentVersionCatalog.value = 0;
                      }

                    },
                    child: Icon(icon.value, color: context.theme.primary))),
                const SizedBox(width: 10),
                AppIcon(AppIcons.share, color: context.theme.primary),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
