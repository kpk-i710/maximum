import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/const/const.dart';
import 'package:maxkgapp/src/pages/catalog/catalog_page.dart';

class Helper {
  static late BoxConstraints constraints;
  static late Orientation orientation;

  static setConstraintsAndOrientation(c, o) {
    constraints = c;
    orientation = o;
  }

  static List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: Color(0xFFFFB24D));
    });
    if (rate - rate.floor() > 0) {
      list.add(Icon(Icons.star_half, size: size, color: Color(0xFFFFB24D)));
    }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star,  size: size, color: Color(0xFFB8B5AF));
    }));
    return list;
  }

  static T responsive<T>(T defValue, {T? xs, T? sm, T? md, T? lg, T? xl}) {
    if (xs != null && constraints.maxWidth < 576) return xs;
    if (sm != null && constraints.maxWidth > 575 && constraints.maxWidth < 768)
      return sm;
    if (md != null && constraints.maxWidth > 767 && constraints.maxWidth < 992)
      return md;
    if (lg != null && constraints.maxWidth > 991 && constraints.maxWidth < 1200)
      return lg;
    if (xl != null && constraints.maxWidth > 1199) return xl;

    return defValue;
  }

  static String numberWithSpaces(int number, {int spaceEvery = 3}) {
    String numStr = number.toString();
    String result = '';

    int spaceCount = spaceEvery;
    for (int index = numStr.length - 1; index >= 0; index--) {
      if (spaceCount == 0) {
        result += ' ';
        spaceCount = spaceEvery;
      }
      result += numStr[index];
      spaceCount--;
    }

    return result.split('').reversed.join();
  }

  static void tabSelect(int index) {
    if (index == 1) {
      Get.dialog(CatalogPage(
          bottomNavigation: true,
          dialog: true,
      )).then((_index) {
        print('helper tabSelect $_index');
        if (_index != null)
          tabSelect(_index);
      });
      return;
    }
    Get.offAllNamed('/main', arguments: index);
  }

  static String? getCorrectUrl(String? url) {
    if (url == null) return null;
    if (url.contains('http://') || url.contains('https://'))
      return url;

    return Const.BASE_URL + (url.startsWith('/') ? url : '/$url');
  }

  static int? parseInt(val, {int? defVal = 0}) {
    try {
      return val is int ? val : int.parse(val);
    } catch(e) {}

    return defVal;
  }

  static double? parseDouble(val, {double? defVal = 0}) {
    try {
      return val is double ? val : double.parse(val);
    } catch(e) {}

    return defVal;
  }

  static String replaceAll(
      String str, List<String> replacementList, String replaceWith) {
    for (var s in replacementList) {
      str = str.replaceAll(s, replaceWith);
    }

    return str;
  }
}
