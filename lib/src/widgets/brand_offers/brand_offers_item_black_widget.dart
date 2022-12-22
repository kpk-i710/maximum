import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/discount.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';

class BrandOffersItemBlackWidget extends StatelessWidget {
  const BrandOffersItemBlackWidget(
      {Key? key, required this.list , this.index})
      : super(key: key);

  final List<Discount> list;

  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: Get.width / 2.7,
        child: widgets.boxShadows(
          padding: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/notebook_item.png",
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 5.0),
                child: Text(
                  "19 000 c",
                  maxLines: 1,

                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "MPLUSRounded1c-Black",
                      fontSize: 14,
                      color: Color(0xff2C2D2E),
                      fontWeight: FontWeight.w900),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 4),
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
                  padding: EdgeInsets.only(left: 5, bottom: 20),
                  child: widgets.rating(3))
            ],
          ),
        ),
      ),
    );
  }
}
