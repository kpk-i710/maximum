import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';

import '../styles.dart';

import 'app_icon.dart';

class FilterWidget extends StatelessWidget {
  final icon = MaterialCommunityIcons.view_grid.obs;

  final Function(String val)? callBack;
  final Function()? onFilterTap;
  FilterWidget({this.callBack, this.onFilterTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
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
                      final f = callBack != null ? callBack! : (a) {};
                      if (icon.value == MaterialCommunityIcons.view_grid) {
                        icon.value = MaterialCommunityIcons.view_list;
                        f('list');
                      } else if (icon.value ==
                          MaterialCommunityIcons.view_list) {
                        icon.value = MaterialCommunityIcons.view_day;
                        f('block');
                      } else {
                        icon.value = MaterialCommunityIcons.view_grid;
                        f('grid');
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
