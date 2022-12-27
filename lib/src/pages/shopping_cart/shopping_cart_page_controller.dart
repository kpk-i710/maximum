import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/checkBox.dart';
import '../../widgets/widgets.dart' as widgets;

class ShoppingCartPageController extends GetxController {
  var counter = 0.obs;

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;

  final checkBoxList = <CheckBox>[].obs;


  bool checkForServices(){
    for(int i=0;i<checkBoxList.length;i++){
      if(checkBoxList[i].isSelected){
        return true;
      }

    }
    return false;
  }

  void changeBoxList({required int index}) {
    checkBoxList[index].isSelected = !checkBoxList[index].isSelected;
    checkBoxList.refresh();
  }

  @override
  void onInit() {
    checkBoxList.add(CheckBox(price: '200', isSelected: false));
    checkBoxList.add(CheckBox(price: '500', isSelected: false));
  }

  List<String>? citys = [
    "Bishkek",
    "Osh",
    "г.Нарын",
    "г.Балыкчы ",
    "г.Узген",
    "г.Джалал-Абад",
    "г.Айдаркан",
    "г.Балыкчы",
    "г.Баткен",
    "г.Жалал-Абад",
    "г.Кадамжай",
  ];
  final selectedCity = Rxn<String>();
  final selectedStreetHouse = Rxn<String>();

  minus() {
    if (counter >= 1) counter = counter - 1;
  }

  plus() {
    counter = counter + 1;
  }
}
