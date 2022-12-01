import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cart_controller.dart';
import '../../styles.dart';

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 40,
          child: Icon(Icons.shopping_cart),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GetX<CartController>(
            init: CartController(),
            builder: (controller) {
              if (controller.cartItems.length > 0)
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 2.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: context.theme.accent,
                  ),
                  child: Text(
                    '${controller.cartItems.length}',
                    style: AppTextStyles.roboto(
                      color: context.theme.onAccent,
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                    ),
                  ),
                );

              return SizedBox();
            },
          ),
        ),
      ],
    );
  }

}