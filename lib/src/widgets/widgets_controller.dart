import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'widgets.dart' as widgets;
import '../models/checkBox.dart';

class WidgetsControllers extends GetxController {
  var counter = 0.obs;

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;

  final checkBoxList = <CheckBox>[
    CheckBox(price: '200', isSelected: false),
    CheckBox(price: '500', isSelected: false)
  ].obs;

  void changeBoxList({required int index}) {
    checkBoxList[index].isSelected = !checkBoxList[index].isSelected;
    checkBoxList.refresh();
  }

  void showMassage({required BuildContext context}) {
    if (Prefs.isAddedToFavorite) {
      widgets.showMassageOneSecondSnackBar(
          context: context, massgae: "removed_from_favorites");
      Prefs.isAddedToFavorite = !Prefs.isAddedToFavorite;
      return;
    }

    if (!Prefs.isAddedToFavorite) {
      widgets.showMassageOneSecondSnackBar(
          context: context, massgae: "added_to_favorites");
      Prefs.isAddedToFavorite = !Prefs.isAddedToFavorite;
    }
  }

  String getPrice(int? price) {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return numberFormat.format(price).replaceAll(",", " ");
  }

  minus() {
    if (counter >= 1) counter = counter - 1;
  }

  plus() {
    counter = counter + 1;
  }

  bool checkForServices() {
    for (int i = 0; i < checkBoxList.length; i++) {
      if (checkBoxList[i].isSelected) {
        return true;
      }
    }
    return false;
  }
}
