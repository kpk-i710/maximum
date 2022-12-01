import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../app_icon.dart';

class SearchBar2 extends StatelessWidget implements PreferredSize {
  final String title;
  SearchBar2({required this.title});

  final searchBar = false.obs;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  Widget get child => AppBar(
    elevation: 0,
    backgroundColor: Get.context!.theme.background,
    leading: BackButton(color: Colors.black),
    title: Obx(() {
      if (searchBar.value)
        return TextField(
          decoration: InputDecoration(
            hintText: 'search'.tr,
            labelStyle: AppTextStyles.roboto(fontSize: 16),
            hintStyle: AppTextStyles.roboto(fontSize: 16,
                color: Get.context!.theme.grey),
            border: InputBorder.none,
          ),
          onSubmitted: (text) {},
        );

      return Text(title, style: AppTextStyles.roboto(fontSize: 16));
    }),
    titleSpacing: 0,
    actions: [
      Obx(() => IconButton(
        padding: EdgeInsets.zero,
        icon: AppIcon(searchBar.value ? AppIcons.cancel : AppIcons.search),
        onPressed: () { searchBar.toggle(); },
      )),
    ],
  );

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}