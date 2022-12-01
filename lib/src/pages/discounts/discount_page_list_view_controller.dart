 import 'package:get/get.dart';

import '../../models/dicount_list_model.dart';
import '../../repositories/dicount_repo_list.dart';

class DiscountPageNewController extends GetxController {
  DiscountListDetaile? dicount_list;
  var isLoaded = false.obs;

  getData() async {
    dicount_list = await RemoteService()
        .getProducts(Get.arguments['idDiscount'].toString());
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