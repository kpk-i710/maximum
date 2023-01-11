import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/models/filter.dart';
import 'package:maxkgapp/src/styles.dart';
import 'widgets.dart' as widgets;
import '../models/checkBox.dart';

class WidgetsControllers extends GetxController {
  RxInt selectedRadioFilter = 0.obs;

  List<Filter> sorts = [
    Filter(title: "by_popularity".tr, subtitle: "frequently_bought".tr),
    Filter(title: "by_rating".tr, subtitle: "highly_rated".tr),
    Filter(title: "cheapest".tr),
    Filter(title: "most_expensive".tr),
    Filter(title: "by_discounts".tr),
  ];

  Rx<Widget> icon = Container(
      child: Icon(
    MaterialCommunityIcons.view_agenda,
    color: AppTextStyles.colorBlueMy,
  )).obs;

  var counter = 0.obs;

  var currentVersionCatalog = 0.obs;

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

  minusWithOutSheet() {
    if (counter >= 1) {
      counter = counter - 1;
      Prefs.counterCard = counter.value;
    }
  }

  @override
  void onInit() {
    counter.value = Prefs.counterCard;
  }

  setIcon(int index) {
    if (index == 1) {
      icon.value = widgets.getViewIcon();
    }
    if (index == 0) {
      icon.value = Container(
          child: Icon(
        MaterialCommunityIcons.view_agenda,
        color: AppTextStyles.colorBlueMy,
      ));
    }
    if (index == 2) {
      icon.value = widgets.getViewIconGrid();
    }
  }

  minus({required BuildContext context}) {
    if (counter >= 1) {
      counter = counter - 1;
      Prefs.counterCard = counter.value;
    }
    if (counter == 0) {
      widgets.showMassageOneSecondSnackBar(
          context: context, massgae: 'removed_from_card');
    }
  }

  plus() {
    counter = counter + 1;
    Prefs.counterCard = counter.value;
  }

  void changeBoxList({required int index}) {
    checkBoxList[index].isSelected = !checkBoxList[index].isSelected;
    checkBoxList.refresh();
  }

  String getDate(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    print("день появления");
    print(tempDate.day);
    print("разница");
    final dates = (DateFormat('d').format(DateTime.now()));

    tempDate.difference(DateTime.now()).inDays;
    if (tempDate
            .difference(DateTime.now())
            .inDays
            .toString()
            .replaceAll("-", "") ==
        "0") return "today".tr;
    return tempDate
            .difference(DateTime.now())
            .inDays
            .toString()
            .replaceAll("-", "") +
        " " +
        "daysShort".tr;
  }

  void showMassage({required BuildContext context, double bottom = 0}) {
    if (Prefs.isAddedToFavorite) {
      widgets.showMassageOneSecondSnackBar(
          context: context, massgae: "removed_from_favorites", bottom: bottom);
      Prefs.isAddedToFavorite = !Prefs.isAddedToFavorite;
      return;
    }

    if (!Prefs.isAddedToFavorite) {
      widgets.showMassageOneSecondSnackBar(
          context: context, massgae: "added_to_favorites", bottom: bottom);
      Prefs.isAddedToFavorite = !Prefs.isAddedToFavorite;
    }
  }

  String getPrice(int? price) {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return numberFormat.format(price).replaceAll(",", " ");
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

final getPrice = Provider.family<String, int>((ref, price) {
  NumberFormat numberFormat = NumberFormat("#,##0", "en,_US");
  return numberFormat.format(price).replaceAll(",", " ");
});



