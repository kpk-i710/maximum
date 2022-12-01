import 'package:get/get.dart';
import 'package:maxkgapp/src/repositories/app_repo.dart';
import 'package:maxkgapp/src/repositories/cart_repo.dart';
import 'package:maxkgapp/src/repositories/catalog_repo.dart';
import 'package:maxkgapp/src/repositories/discount_repo.dart';
import 'package:maxkgapp/src/repositories/order_repo.dart';
import 'package:maxkgapp/src/repositories/product_repo.dart';
import 'package:maxkgapp/src/repositories/user_repo.dart';

import '../cart_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // repositories
    Get.put(AppRepo());
    Get.put(CartRepo());
    Get.put(CatalogRepo());
    Get.put(DiscountRepo());
    Get.put(OrderRepo());
    Get.put(ProductRepo());
    Get.put(UserRepo());

    // controllers
    Get.put(CartController());
  }
}
