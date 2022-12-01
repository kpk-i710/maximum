import 'package:flutter/material.dart';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShippingMethodsController extends GetxController {
  RxInt selectedPage = 0.obs;

  late PageController controllerPage;

  RxInt selectedRadio = 1.obs;

  bool isTwopage (){
    if(selectedPage.value == 1){
      return true;
    } else return false;

  }

  bool isFirstpage (){
    if(selectedPage.value == 0){
      return true;
    } else return false;

  }


  @override
  void onInit() {
    controllerPage = PageController(initialPage: 0);
  }

  change(int? value) {
    selectedRadio.value = value!;
  }
}
