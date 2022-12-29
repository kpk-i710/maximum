

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../../models/dicount_list_model.dart';
import '../../repositories/dicount_repo_list.dart';

class FavoritePageController extends GetxController {
  DiscountListDetaile? dicount_list;
  var isLoaded = false.obs;
  void tabSelect(int index) => Helper.tabSelect(index);
  getData() async {
    dicount_list = await RemoteService()
        .getProducts("799");
    if (dicount_list != null) {
      isLoaded.value = true;
    }
  }

  String getPrice(int? price){
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
    return  numberFormat.format(price).replaceAll(",", " ");
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

}