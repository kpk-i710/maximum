import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart_controller.dart';
import '../../models/product.dart';
import '../../widgets/app_icon.dart';
import '../../styles.dart';

class CartCircleButtonWidget extends StatelessWidget {
  final inCart = false.obs;
  final loading = false.obs;
  final Product product;

  final cartController = Get.find<CartController>();

  CartCircleButtonWidget(this.product);

  @override
  Widget build(BuildContext context) {
    inCart.value = cartController.inCart(product.productId!);
    return Container(
      height: 35,
      width: 35,
      child: Ink(
          /*decoration: BoxDecoration(
            color: colors.mainColor,
            border: Border.all(color: colors.mainColor, width: 2.5),
            borderRadius: BorderRadius.all(Radius.circular(100)),
          ),*/
          child: Obx(() => IconButton(
                iconSize: 18,
                padding: EdgeInsets.zero,
                icon: AnimatedSwitcher(
                    duration: Duration(milliseconds: 500),
                    child: loading.value
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.blue)))
                        : inCart.value
                            ? AppIcon(AppIcons.in_cart,
                                color: context.theme.primary, size: 35)
                            : AppIcon(AppIcons.cart,
                                color: context.theme.primary, size: 35)),
                color: inCart.value ? Colors.black45 : Colors.black26,
                onPressed: inCart.value
                    ? null
                    : () {
                        loading.value = true;
                        Get.find<CartController>()
                            .addProduct(product)
                            .then((value) {
                          inCart.value = true;
                          loading.value = false;
                        });
                      },
              ))),
    );
  }
}
