import 'package:get/get.dart';
import 'package:maxkgapp/src/repositories/discount_repo.dart';

import '../../helpers/helper.dart';
import '../../models/discount.dart';

class DiscountPageController extends GetxController {
  final _discount = Discount.fromMap({}).obs;
  final _isReady = false.obs;

  Discount get discount => _discount.value;
  bool get isReady => _isReady.value;

  final _discountRepo = Get.find<DiscountRepo>();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is Discount) {
      _discount.value = Get.arguments as Discount;
      getDiscountInfo();
    } else {
      throw ArgumentError('Wrong or null argument');
    }
  }

  void tabSelect(int index) => Helper.tabSelect(index);

  getDiscountInfo() async {
    final response = await _discountRepo.getDiscount(discount.id);
    if (response.isOk) {
      _discount.value = response.body;
    }
  }

  Future<void> onRefresh() async {
    await getDiscountInfo();
  }
}
