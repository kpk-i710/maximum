import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../models/product.dart';
import '../../cart_controller.dart';

class CartWithTextButtonWidget extends StatelessWidget {
  final inCart = false.obs;
  final loading = false.obs;
  final Product product;

  CartWithTextButtonWidget(this.product);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ElevatedButton(
      onPressed: inCart.value
          ? () {}
          : () {
              loading.value = true;
              Get.find<CartController>().addProduct(product).then((value) {
                inCart.value = true;
                loading.value = false;
              });
            },
      style: ElevatedButton.styleFrom(
        primary: inCart.value ? Color(0xFF18A10C) : context.theme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Row(
            children: [
              loading.value
                  ? Container(
                      width: 20,
                      margin: EdgeInsets.only(right: 10),
                      child: CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(context.theme.primary)),
                    )
                  : SizedBox(),
              FittedBox(
                  child: Text(
                      inCart.value
                          ? 'in_cart'.tr.toUpperCase()
                          : 'to_cart'.tr.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))),
            ],
          ),
    ));
  }
}
