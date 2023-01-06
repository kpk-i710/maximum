import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../../models/news.dart';
import '../../models/news_list.dart';
import '../../repositories/app_repo.dart';
import '../../repositories/dicount_repo_list.dart';

class BetweenAllPagesController extends GetxController {

  NewsList? newsList  ;
  var isLoaded = false.obs;

  void tabSelect(int index) => Helper.tabSelect(index);
  @override
  Future<void> onInit() async {
    print("число");
    newsList =
        await RemoteService().getNews(Get.arguments!=null?Get.arguments['idNews'].toString():"382");
    if (newsList != null) {
      isLoaded.value = true;
    }
    super.onInit();
  }
  String getPrice(int? price){
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return  numberFormat.format(price).replaceAll(",", " ");
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

}
