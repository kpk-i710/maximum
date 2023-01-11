import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/discount.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class BoughtTodayItemBlackWidget extends StatelessWidget {
  const BoughtTodayItemBlackWidget({Key? key,   this.index})
      : super(key: key);


  final index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0, top: 8.0, bottom: 8),
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
                  style: widgets.robotoConsid(
                      fontSize: 14, fontWeight: FontWeight.w900),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 4),
                child: Text(
                  "Менделейка / Набор для опытов 6шт /Детский наборdsfffffffffffffffff",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: widgets.robotoConsid(
                      fontSize: 14, fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 5, bottom: 0),
                  child: widgets.rating(3))
            ],
          ),
        ),
      ),
    );
  }
}
