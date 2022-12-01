import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPageController extends GetxController {
  final ranges = RangeValues(0, 10000).obs;

  final priceStartCont = TextEditingController().obs;
  final priceEndCont = TextEditingController().obs;

  final getTodayCheck = false.obs;
  final bestPriceCheck = false.obs;
  final cashb = false.obs;

  @override
  void onInit() {
    super.onInit();
    // priceStartCont.value.text = ranges.value.start.toString();
    // priceEndCont.value.text = ranges.value.end.toString();
  }

  changeRanges(RangeValues val) {
    ranges.value = val;
    priceStartCont.value.text = val.start.toStringAsFixed(2);
    priceEndCont.value.text = val.end.toStringAsFixed(2);
  }

  onStartPriceChanged(String val) {
    double price = double.tryParse(val) ?? 0;
    if (price <= ranges.value.end && price > 0) {
      ranges.value = RangeValues(price, ranges.value.end);
    } else {
      priceStartCont.value.text = ranges.value.start.toStringAsFixed(2);
    }
  }

  onEndPriceChanged(String val) {
    double price = double.tryParse(val) ?? 0;
    if (price > ranges.value.start && price <= ranges.value.end) {
      ranges.value = RangeValues(ranges.value.start, price);
    } else {
      priceEndCont.value.text = ranges.value.end.toStringAsFixed(2);
    }
  }

  reset() {
    ranges.value = RangeValues(0, 10000);
    priceStartCont.value.text = '';priceEndCont.value.text = '';
    getTodayCheck.value = false;
    bestPriceCheck.value = false;
    cashb.value = false;
  }
}
