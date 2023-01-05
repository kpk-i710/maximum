import 'package:get/get.dart';
import 'const/const.dart';
import 'helpers/prefs.dart';
import 'models/cart.dart';
import 'repositories/cart_repo.dart';
import 'models/product.dart';

class CartController extends GetxController {
  final items = <Cart>[].obs;
  List<Cart> get cartItems => items;

  final cartRepo = Get.find<CartRepo>();

  Future<bool> addItem(Cart cart) async {
    for (var i = 0; i < cartItems.length; i++) {
      if ((cartItems[i].productId != cart.productId) &&
          (cartItems[i].title == cart.title)) {
        return false;
      }
      if (cartItems[i].productId == cart.productId) {
        cartItems[i].quantity++;
        items.refresh();
        cartRepo.updateCart(cart);
        return true;
      }
    }

    cart.id = await cartRepo.addToCart(cart);

    cartItems.add(cart);
    items.refresh();
    return true;
  }

  void checkAll(bool val) {
    cartItems.forEach((element) {
      element.checked = val;
    });
    items.refresh();
  }

  removeSelected() {
    cartItems.removeWhere((element) {
      if (element.checked) cartRepo.deleteFromCart(element);

      return element.checked;
    });
    items.refresh();
  }

  Future<bool> addProduct(Product product, {int quantity = 1}) async {
    return addItem(Cart(
      quantity: quantity,
      productId: product.productId,
      sid: product.productId,
      title: product.name,
      image: product.image,
      postId: product.postId,
      price: product.price,
    ));
  }

  void clear() {
    cartItems.clear();
    items.refresh();
    cartRepo.deleteAllFromCart();
  }

  Cart decreaseItem(Cart cart) {
    int index = cartItems.indexOf(cart);
    cartItems[index].quantity--;
    if (cartItems[index].quantity < 1) {
      cartRepo.deleteFromCart(cartItems[index]);
      cartItems.removeAt(index);
    } else {
      cartRepo.updateCart(cartItems[index]);
    }
    items.refresh();

    return cartItems[index] ?? cart;
  }

  Cart increaseItem(Cart cart) {
    int index = cartItems.indexOf(cart);
    cartItems[index].quantity++;
    items.refresh();

    cartRepo.updateCart(cartItems[index]);

    return cartItems[index];
  }

  void remove(Cart cart) {
    cartRepo.deleteFromCart(cart);

    cartItems.remove(cart);
    items.refresh();
  }

  void removeWhere(Product product) {
    int index = cartItems
        .indexWhere((element) => element.productId == product.id);

    cartRepo.deleteFromCart(cartItems[index]);

    cartItems.remove(index);
    items.refresh();
  }

  void refreshCartList() {
    cartItems.clear();
    items.refresh();
    cartRepo.getCartList().then((value) {
      cartItems.addAll(value);
      items.refresh();
    });
  }

  bool inCart(int productId) => cartItems
        .indexWhere((element) => element.productId == productId) > -1;

  @override
  void onInit() {
    super.onInit();
    refreshCartList();
    Prefs.listenKey(PrefsKeys.IS_LOGIN_KEY, loginListener);
  }

  @override
  void onClose() {
    items.close();
    super.onClose();
  }

  loginListener(value) async {
    if (value) await cartRepo.moveLocalCartToApi();

    refreshCartList();
  }
}
