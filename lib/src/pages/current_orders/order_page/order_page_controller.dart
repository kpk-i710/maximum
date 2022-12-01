import 'package:get/get.dart';

import '../../../models/order.dart';

class OrderPageController extends GetxController {
  late Order order;



  @override
  void onInit() {
    if (Get.arguments != null && Get.arguments is Order) {
      order = Get.arguments as Order;
    } else {
      throw Exception('Invalid or null argument');
    }
    super.onInit();
  }
}