import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/discount.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class BoughtTodayItemBlackWidget extends StatelessWidget {
  const BoughtTodayItemBlackWidget(
      {Key? key, required this.list,  this.index})
      : super(key: key);

  final List<Discount> list;

  final index;

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
              padding: const EdgeInsets.only(left: 9.0,top: 2.0),
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
              padding: const EdgeInsets.only(left: 9.0,bottom: 4),
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
            Padding(padding: EdgeInsets.only(left: 9, bottom: 20),
            child: widgets.rating(3))
          ],
        ),
      ),
    );
  }
}
