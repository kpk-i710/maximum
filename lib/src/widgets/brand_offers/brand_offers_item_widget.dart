import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../models/discount.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class BrandOffersItemWidget extends StatelessWidget {
  const BrandOffersItemWidget(
      {Key? key, required this.list , this.index})
      : super(key: key);

  final List<Discount> list;

  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0,top: 8,bottom: 8),
      child: SizedBox(
        width: Get.width / 2.7,
        child: widgets.boxShadows(
          padding: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 15),
              Center(
                child: Image.asset(
                  "assets/images/sofaRed.png",
                  fit: BoxFit.contain,
                  height: Get.width / 3,
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 5),
                  Text(
                    "19 000 c",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style:  widgets.robotoConsid(
                        fontSize: 16,
                        color: AppTextStyles.colorRedMy,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(top: 3.0),
                    child: widgets.strikeThroughWidget(
                      child: Text(
                        "46 850 с",
                        maxLines: 1,
                        textAlign: TextAlign.center,

                        style: widgets.robotoConsid(
                          fontSize: 12,
                          color: AppTextStyles.colorGreyThrou,
                          fontWeight: FontWeight.w600,
                        ),
                      ), length:    "46 850 с".length, fontSize: 12,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 9.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
