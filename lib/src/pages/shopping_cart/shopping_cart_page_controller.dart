import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/widgets.dart' as widgets;
class ShoppingCartPageController extends GetxController {
  var counter = 0.obs;

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;


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

  RxInt selectedRadio = 1.obs;
  change({int? value, required String paymentMethod}) {
    selectedRadio.value = value!;
  }


  minus() {
    if (counter >= 1) counter = counter - 1;
  }


  plus() {
    counter = counter + 1;
  }
}
