import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_swipe_widget_offline.dart';

import '../../models/discount.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class PopularGoodsItemWidget extends StatelessWidget {
  PopularGoodsItemWidget(
      {Key? key, required this.list, this.index, required this.onTap})
      : super(key: key);

  final List<Discount> list;
  Function() onTap;

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
                  GestureDetector(
                    onTap: onTap,
                    child: DiscountSwipeWidgetOffline(
                        image: "assets/images/sofaRed.png"),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppTextStyles.colorRedMy,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        ' - ${list[index].discountValue}%',
                        style: widgets.robotoConsid(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
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
                    style: widgets.robotoConsid(
                        fontSize: 16,
                        color: AppTextStyles.colorRedMy,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Expanded(
                  child: AutoSizeText(
                    "46 850 сом",
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    maxFontSize: 12,
                    style: widgets.robotoConsid(
                      fontSize: 12,
                      color: AppTextStyles.colorGreyThrou,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ),
              ],
            ),
            widgets.bottomPopularCards(index: index)
          ],
        ),
      ),
    );
  }
}
