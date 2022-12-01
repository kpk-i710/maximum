import 'dart:math';

import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../const/const.dart';
import '../helpers/prefs.dart';
import '../models/cart.dart';
import '../repositories/product_repo.dart' show product;
import 'base_repo.dart';

class CartRepo extends BaseRepo {

  getCartList() async {
    List<Cart> list = [];
    if (Prefs.isLogin) {
      try {
        print('baseUrl ${httpClient.baseUrl}');
        final response = await get('box',
            decoder: (val) => (val as List).map((e) => Cart.fromMap(e)).toList());
        list = response.body ?? [];
      } catch(e) {
        print('box error $e');
      }
    } else {
      list = await _getLocalCartList();
      print("local list ${list.length}");
      list.forEach((e) => print("${e.id} ${e.title} ${e.quantity}"));
    }
    return list;
  }

  addToCart(Cart cart) async {
    if (Prefs.isLogin) {
      final Map<String, dynamic> data = {};
      if (cart.productId != null)
        data['id_tov'] = cart.productId;
      if (cart.sid != null)
        data['sid'] = cart.sid;
      data['kol'] = cart.quantity;

      final response = await post('box', data, decoder: (r) => Cart.fromMap(r));

      return response.body!.id;
    } else {
      return await _addToLocalCart(cart);
    }
  }

  updateCart(Cart cart) async {
    if (Prefs.isLogin) {
      final Map<String, dynamic> data = {};
      if (cart.productId != null)
        data['id_tov'] = cart.productId;
      data['kol'] = cart.quantity;

      final response = await patch('box/${cart.id}', data);

      return cart.id;
    } else {
      return await _updateLocalCart(cart);
    }
  }

  deleteFromCart(Cart cart) async {
    if (Prefs.isLogin) {
      final response = await delete('box/${cart.id}');

      return cart.id;
    } else {
      return await _deleteFromLocalCart(cart);
    }
  }

  deleteAllFromCart() async {
    if (Prefs.isLogin) {
      await Future.delayed(Duration(seconds: 4));
    } else {
      await _deleteAllFromLocalCart();
    }
  }

  Future<List<Cart>> _getLocalCartList() async {
    final list = <Cart>[];

    final res = await db.query("cart");
    for (int i = 0; i < res.length; i++) {
      final map = {
        "id": res[i]["id"],
        "quantity": res[i]["quantity"],
        "product": await db.find(Const.CART_PRODUCTS_TABLE,
            res[i]['product_id']),
      };
      list.add(Cart.fromMap(map));
    }
    return list;
  }

  _addToLocalCart(Cart cart) async => await db.insert(cart);

  _updateLocalCart(Cart cart) async => await db.update(cart);

  _deleteFromLocalCart(Cart cart) async => await db.delete(cart);

  _deleteAllFromLocalCart() async {
    await db.deleteAll(Const.CART_PRODUCTS_TABLE);
    return await db.deleteAll(Const.CART_TABLE);
  }
  
  moveLocalCartToApi() async {
    final list = await _getLocalCartList();
    for (int i = 0; i < list.length; i++) {
      // await post(url, body)
    }
  }
}
