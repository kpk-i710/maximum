import 'package:get/get.dart';

import '../../helpers/helper.dart';
import '../../models/discount.dart';
import '../../repositories/discount_repo.dart';

class DiscountsListPageController extends GetxController {
  final discountList = <Discount>[].obs;

  final _discountRepo = Get.find<DiscountRepo>();

  @override
  void onInit() {
    super.onInit();
    refreshAll();
  }

  refreshAll() {
    _discountRepo.getDiscountList().then((value) {
      discountList.addAll(value.body);
      discountList.refresh();
    });
  }

  clearAll() {
    discountList.clear();
    discountList.refresh();
  }

  void tabSelect(int index) => Helper.tabSelect(index);

  Future<void> onRefresh() async {
    clearAll();
    refreshAll();
  }
}
