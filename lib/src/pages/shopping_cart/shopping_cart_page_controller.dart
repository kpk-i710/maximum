import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/order.dart';
import '../../widgets/widgets.dart' as widgets;
class ShoppingCartPageController extends GetxController {
  var counter = 0.obs;


  List<String>? citys = [
    "г.Бишкек",
    "г.Ош",
    "г.Нарын",
    "г.Балыкчы ",
    "г.Узген",
    "г.Джалал-Абад1",
    "г.Джалал-Абад2",
    "г.Джалал-Абад3",
    "г.Джалал-Абад4",
    "г.Джалал-Абад5",
    "г.Джалал-Абад6",
    "г.Джалал-Абад7",
    "г.Джалал-Абад8",
    "г.Джалал-Абад9",
    "г.Джалал-Абад10",
    "г.Джалал-Абад11",
    "г.Джалал-Абад12",
    "г.Джалал-Абад13",
    "г.Джалал-Абад14",
    "г.Джалал-Абад15",
    "г.Джалал-Абад16",
    "г.Джалал-Абад17",
    "г.Джалал-Абад18",
    "г.Джалал-Абад19",
    "г.Джалал-Абад20",
    "г.Джалал-Абад21",
    "г.Джалал-Абад22",
    "г.Джалал-Абад23",
    "г.Джалал-Абад24",
    "г.Джалал-Абад25",
    "г.Джалал-Абад26",
    "г.Джалал-Абад27",
    "г.Джалал-Абад28",

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
