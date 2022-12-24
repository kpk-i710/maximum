import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../models/product.dart';
import 'package:flutter/material.dart';

import '../cart_widgets/cart_with_text_button.dart';

class BestsellersItemWidget extends StatelessWidget {
  const BestsellersItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ConstrainedBox(

        constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: 180,

        ),
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
                height: 180,
                child: Stack(
                  children: [
                    Image.asset(
                      "assets/images/notebook_item.png",
                      fit: BoxFit.fill,
                      height: 180,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0, top: 2.0),
                child: AutoSizeText(
                  "19 000 c",
                  maxLines: 1,
                  maxFontSize: 16,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "MPLUSRounded1c-Black",
                      fontSize: 16,
                      color: Color(0xff2C2D2E),
                      fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0, bottom: 4),
                child: AutoSizeText(
                  "Менделейка / Набор для опытов 6шт /Детский наборdsfffffffffffffffff",
                  maxFontSize: 14,
                  minFontSize: 14,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                      fontFamily: "RobotoCondensed-Regular",
                      fontSize: 14,
                      fontWeight: FontWeight.w200),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 9, bottom: 10),
                  child: widgets.rating(3))
            ],
          ),
        ),
      ),
    );
  }
}
