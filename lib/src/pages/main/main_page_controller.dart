import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../catalog/catalog_page.dart';
import '../home/home_page.dart';
import '../favorite/favorite_page.dart';
import '../user/profile/profile_page.dart';

class MainPageController extends GetxController {
  final pages = [
    HomePage(),
    CatalogPage(),
    FavoritePage(),
    // CartPage(),
    ProfilePage(),
  ];

  Widget currentPage = HomePage();
  var currentTab = 0;

  @override
  void onInit() {
    if (Get.arguments != null) {
      currentTab = Get.arguments as int;
    }
    currentPage = pages[currentTab];
    super.onInit();
  }

  void tabSelect(int index) {
    currentTab = index;
    currentPage = pages[index];
    update();
  }
}
