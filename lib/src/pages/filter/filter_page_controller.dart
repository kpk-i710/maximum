import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPageController extends GetxController {
  final ranges = RangeValues(0, 10000).obs;


  final RxInt selectedBrend = 100.obs;
  final RxInt selectedDelivery = 100.obs;
  final RxInt selectedDiscounts = 100.obs;

  final priceStartCont = TextEditingController();

  final priceEndCont = TextEditingController();

  final getTodayCheck = false.obs;
  final bestPriceCheck = false.obs;
  final cashb = false.obs;

  List<String> delivryTimeList = ['В течении часа','1-2 дня','10-14 дней',];
  List<String> discountsList = ['Есть','Нет',];

  @override
  void onInit() {
    super.onInit();
    // priceStartCont.value.text = ranges.value.start.toString();
    // priceEndCont.value.text = ranges.value.end.toString();
  }

  changeRanges(RangeValues val) {
    ranges.value = val;
    priceStartCont.text = val.start.toStringAsFixed(2);
    priceEndCont.text = val.end.toStringAsFixed(2);
  }

  onStartPriceChanged(String val) {
    print(val);
  }

  onEndPriceChanged(String val) {
    print(val);
  }

  reset() {
    ranges.value = RangeValues(0, 10000);
    priceStartCont.text = '';
    priceEndCont.text = '';
    getTodayCheck.value = false;
    bestPriceCheck.value = false;
    cashb.value = false;
  }
}
