import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/multi_select.dart';

class FilterPageController extends GetxController {
  final ranges = RangeValues(0, 10000).obs;

  final priceStartCont = TextEditingController();

  final priceEndCont = TextEditingController();

  RxInt filtedCounter = 0.obs;
  RxInt brandCounter = 0.obs;
  RxInt delivaryCounter = 0.obs;
  RxInt discountCounter = 0.obs;

  final getTodayCheck = false.obs;
  final bestPriceCheck = false.obs;
  final cashb = false.obs;

  RxList<MultiSelect> brandList = <MultiSelect>[
    MultiSelect(title: 'Acer'),
    MultiSelect(title: 'Lenovo'),
    MultiSelect(title: 'Samsung'),
    MultiSelect(title: 'Nokia'),
    MultiSelect(title: 'Asus'),
    MultiSelect(title: 'Xiomi')
  ].obs;

  RxList<MultiSelect> delivryTimeList = <MultiSelect>[
    MultiSelect(title: 'В течении часа'),
    MultiSelect(title: '1-2 дня'),
    MultiSelect(title: '10-14 дней'),
  ].obs;

  RxList<MultiSelect> discountsList = <MultiSelect>[
    MultiSelect(title: ' Есть'),
    MultiSelect(title: 'Нет'),
  ].obs;

  calculateCountFilter() {
    final brand =
        brandList.where((item) => item.isSelected == true).toList().length;
    final delivry = delivryTimeList
        .where((item) => item.isSelected == true)
        .toList()
        .length;
    final discount =
        discountsList.where((item) => item.isSelected == true).toList().length;
    final startText = priceStartCont.text.length > 0 ? 1 : 0;
    final endText = priceEndCont.text.length > 0 ? 1 : 0;
    filtedCounter.value = brand + delivry + discount + startText + endText;
    brandCounter.value = brand;
    discountCounter.value = discount;
    delivaryCounter.value = delivry;
  }

  resetAll() {
    resetLists();
    priceStartCont.text = "";
    priceEndCont.text = "";
    final brand =
        brandList.where((item) => item.isSelected == true).toList().length;
    final discount =
        discountsList.where((item) => item.isSelected == true).toList().length;
    final delivry = delivryTimeList
        .where((item) => item.isSelected == true)
        .toList()
        .length;
    brandCounter.value = brand;
    discountCounter.value = discount;
    delivaryCounter.value = delivry;
  }

  resetBrend() {
    for (int i = 0; i < brandList.length; i++) brandList[i].isSelected = false;
    brandList.refresh();
    brandCounter.value = 0;
    calculateCountFilter();
  }

  resetDelivery() {
    for (int i = 0; i < delivryTimeList.length; i++)
      delivryTimeList[i].isSelected = false;
    delivryTimeList.refresh();
    delivaryCounter.value = 0;
    calculateCountFilter();
  }

  resetDiscount() {
    for (int i = 0; i < discountsList.length; i++)
      discountsList[i].isSelected = false;
    discountsList.refresh();
    discountCounter.value = 0;
    calculateCountFilter();
  }

  resetLists() {
    for (int i = 0; i < brandList.length; i++) brandList[i].isSelected = false;
    for (int i = 0; i < delivryTimeList.length; i++)
      delivryTimeList[i].isSelected = false;
    for (int i = 0; i < discountsList.length; i++)
      discountsList[i].isSelected = false;
    discountsList.refresh();
    brandList.refresh();
    delivryTimeList.refresh();
    calculateCountFilter();
  }

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
