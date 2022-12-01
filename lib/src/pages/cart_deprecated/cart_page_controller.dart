import 'package:get/get.dart';

import '../../cart_controller.dart';
import '../../models/own_cart.dart';
import '../../repositories/product_repo.dart';
import '../../repositories/catalog_repo.dart';
import '../../models/product.dart';
import '../../repositories/user_repo.dart';

class CartPageController extends GetxController {
  final cart = Get.find<CartController>();

  final _checkAllVal = false.obs;
  final _viewedProductsList = <Product>[].obs;

  bool get checkAllVal => _checkAllVal.value;

  List<Product> get viewedProductsList => _viewedProductsList.value;

  final productRepo = Get.find<ProductRepo>();
  final catalogRepo = Get.find<CatalogRepo>();

  List<OwnCartModel>? ownCartList;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("октрыть корзину");
    getData();
    refreshLists();
  }

  getData() async {
    ownCartList = await UserRepo().getRequestGetOwnCart();
    if (ownCartList != null) {
      isLoaded.value = true;
    }
  }

  void refreshLists() {
    productRepo.getViewedProductList().then((value) {
      _viewedProductsList.addAll(value);
      _viewedProductsList.refresh();
    });
  }

  void checkAll(bool val) {
    _checkAllVal.value = val;
    cart.checkAll(val);
  }

  removeSelected() {
    cart.removeSelected();
  }

  getCartItems() {
    return cart.cartItems;
  }

  @override
  void onClose() {
    _viewedProductsList.close();
    super.onClose();
  }
}
