


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/discount.dart';
import '../../styles.dart';

class BoughtTodayItemWidget extends StatelessWidget {
  const BoughtTodayItemWidget({Key? key, required this.list , this.index}) : super(key: key);

  final List<Discount> list;

  final index;
  @override
  Widget build(BuildContext context) {
    return  Padding(
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
              height: 180,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      "assets/images/sofaRed.png",
                      fit: BoxFit.fill,
                      height: 180,
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff991A4E),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      child: Text(
                        ' - ${list[index].discountValue}%',
                        style: AppTextStyles.robotoCondensed(
                            color: context.theme.onAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 9.0),
                  child: AutoSizeText(
                    "19 000 c",
                    maxLines: 1,
                    maxFontSize: 16,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "MPLUSRounded1c-Black",
                        fontSize: 16,
                        color: Color(0xff991A4E),
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    "46 850 с",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    maxFontSize: 12,
                    style: TextStyle(
                      fontFamily: "MPLUSRounded1c-Black",
                      fontSize: 12,
                      color: Color(0xff62656A),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0, bottom: 40),
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
    );
  }
}
