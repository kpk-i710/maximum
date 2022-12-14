import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../../models/news.dart';
import '../../models/news_list.dart';
import '../../repositories/app_repo.dart';
import '../../repositories/dicount_repo_list.dart';
import 'dart:math';

class BetweenAllPagesController extends GetxController {
  NewsList? newsList;


  int getRandomTitle() {
    var rng = Random();
    return rng.nextInt(10000);
  }



  void tabSelect(int index) => Helper.tabSelect(index);


  String getPrice(int? price) {
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return numberFormat.format(price).replaceAll(",", " ");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
