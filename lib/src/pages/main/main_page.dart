import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import '../../pages/user/profile/profile_page.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../pages/catalog/catalog_page.dart';
import '../../pages/favorite/favorite_page.dart';
import '../../pages/home/home_page.dart';
import '../shopping_cart/shopping_cart_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final pages = [
    HomePage(key: UniqueKey()),
    // CatalogNew(key: UniqueKey()),
    CatalogPage(key: UniqueKey(), bottomNavigation: true, dialog: true),
    FavoritePage(),
    // CartPage(key: UniqueKey()),
    ShoppingCartPage(),
    ProfilePage(key: UniqueKey()),
  ];

  Widget currentPage = HomePage(key: UniqueKey());
  int currentTab = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (Get.arguments != null) {
          currentTab = Get.arguments as int;
        }
        currentPage = pages[currentTab];
      });
    });

    super.initState();
  }

  void tabSelect(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (index == 1) {
          Get.dialog(pages[index]).then((_index) {
            if (_index != null) tabSelect(_index);
          });
          return;
        }
        currentTab = index;
        currentPage = pages[index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("текущая страница");
        print(currentTab);
        if (currentTab > 0) {
          setState(() {
            tabSelect(0);
          });
        }
        if (currentTab == 0) {
          return true;
        }
        return false;
      },
      child: Scaffold(
        body: AnimatedSwitcher(
          transitionBuilder: (child, animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          duration: const Duration(milliseconds: 300),
          child: currentPage,
          switchOutCurve: Curves.easeInOutCubic,
          switchInCurve: Curves.easeOut,
        ),
        bottomNavigationBar: widgets.bottomNavigation(
          currentTab: currentTab,
          onSelectTab: tabSelect,
        ),
      ),
    );
  }
}
