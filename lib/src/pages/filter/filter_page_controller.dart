import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/multi_select.dart';

class FilterPageController extends GetxController {
  RxList<MultiSelect> brandList = <MultiSelect>[
    MultiSelect(title: 'Acer'),
    MultiSelect(title: 'Lenovo'),
    MultiSelect(title: 'Samsung'),
    MultiSelect(title: 'Nokia'),
    MultiSelect(title: 'Asus'),
    MultiSelect(title: 'Xiomi'),
    MultiSelect(title: 'LG')
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

  final priceStartCont = TextEditingController();
  final priceEndCont = TextEditingController();


  RxBool isSearched = false.obs;
  RxInt filtedCounter = 0.obs;
  RxInt brandCounter = 0.obs;
  RxInt delivaryCounter = 0.obs;
  RxInt discountCounter = 0.obs;

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
  }

  resetAll() {
    resetLists();
    priceStartCont.text = "";
    priceEndCont.text = "";
  }

  resetBrend() {
    for (int i = 0; i < brandList.length; i++) brandList[i].isSelected = false;
    brandList.refresh();
    calculateCountFilter();
  }

  resetDelivery() {
    for (int i = 0; i < delivryTimeList.length; i++)
      delivryTimeList[i].isSelected = false;
    delivryTimeList.refresh();
    calculateCountFilter();
  }

  resetDiscount() {
    for (int i = 0; i < discountsList.length; i++)
      discountsList[i].isSelected = false;
    discountsList.refresh();
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
    ever(brandList, (velue) {
      final brand =
          brandList.where((item) => item.isSelected == true).toList().length;
      brandCounter.value = brand;
    });
    ever(discountsList, (velue) {
      final discount = discountsList
          .where((item) => item.isSelected == true)
          .toList()
          .length;
      discountCounter.value = discount;
    });

    ever(delivryTimeList, (velue) {
      final delivry = delivryTimeList
          .where((item) => item.isSelected == true)
          .toList()
          .length;

      delivaryCounter.value = delivry;
    });
  }

  onStartPriceChanged(String val) {
    print(val);
  }

  onEndPriceChanged(String val) {
    print(val);
  }
}
