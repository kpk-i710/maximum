

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../models/dicount_list_model.dart';
import '../../repositories/dicount_repo_list.dart';

class FavoritePageController extends GetxController {
  DiscountListDetaile? dicount_list;
  var isLoaded = false.obs;

  getData() async {
    dicount_list = await RemoteService()
        .getProducts("799");
    if (dicount_list != null) {
      isLoaded.value = true;
    }
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

}