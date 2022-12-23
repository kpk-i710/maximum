import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/discount.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_swipe_widget.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_swipe_widget_offline.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';

class PopularGoodsItemBlackWidget extends StatelessWidget {
  PopularGoodsItemBlackWidget(
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
                        image: "assets/images/sofa.png"),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Color(0xff142A65),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        'hit'.tr.toUpperCase(),
                        style: widgets.robotoConsid(
                            color: context.theme.onAccent,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0, top: 8.0),
              child: Text(
                "19 000 c",
                maxLines: 1,
                textAlign: TextAlign.center,
                style: widgets.robotoConsid(
                    fontSize: 17,
                    color: Color(0xff2C2D2E),
                    fontWeight: FontWeight.w900),
              ),
            ),
           widgets.bottomPopularCards(index: index)
          ],
        ),
      ),
    );
  }
}
