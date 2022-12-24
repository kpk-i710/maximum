import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../models/product.dart';
import '../../cart_controller.dart';

class CartWithTextButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTextStyles.colorBlueMy,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      child: Row(
        children: [
          FittedBox(
              child: Text('to_cart'.tr.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
