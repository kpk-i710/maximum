import 'package:get/get.dart';

import '../../models/order.dart';

class ShoppingCartPageController extends GetxController {
  var counter = 0.obs;

  minus() {
    if (counter >= 1) counter = counter - 1;
  }

  plus() {
    counter = counter + 1;
  }
}
