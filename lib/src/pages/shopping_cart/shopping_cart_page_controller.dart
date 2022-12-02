import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart' as widgets;
class ShoppingCartPageController extends GetxController {
  var counter = 0.obs;


  List<String>? citys = [
    "г.Бишкек",
    "г.Ош",
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
  final  selectedCity =Rxn<String>( );
  final  selectedStreetHouse =Rxn<String>( );

  minus() {
    if (counter >= 1) counter = counter - 1;
  }


  plus() {
    counter = counter + 1;
  }
}
