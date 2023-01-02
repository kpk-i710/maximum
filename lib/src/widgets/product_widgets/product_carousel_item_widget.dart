import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../styles.dart';
import '../../widgets/cart_widgets/cart_circle_button_widget.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductCarouselItemWidget extends StatelessWidget {
  final double? width;

  ProductCarouselItemWidget({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xffD9D9D9).withOpacity(0.6),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/images/notebook_item.png",
                    fit: BoxFit.fill,
                    width: Get.width / 2.7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, top: 2.0),
              child: Text(
                "19 000 c",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: widgets.robotoConsid(
                    fontSize: 16, fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              width: width,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 4),
                child: Text(
                  "Менделейка / Набор для опытов 6шт /Детский наборdsfffffffffffffffff",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: widgets.robotoConsid(),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: 5, bottom: 20),
                child: widgets.rating(3))
          ],
        ),
      ),
    );
  }
}
