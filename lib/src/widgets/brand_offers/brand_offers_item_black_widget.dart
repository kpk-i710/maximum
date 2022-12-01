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
                    "assets/images/sofa.png",
                    fit: BoxFit.fill,
                    height: 180,
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
              padding: const EdgeInsets.only(left: 9.0, top: 2.0),
              child: AutoSizeText(
                "19 000 c",
                maxLines: 1,
                maxFontSize: 16,
                textAlign: TextAlign.center,
                style:  widgets.robotoConsid(

                    fontSize: 16,
                    color: Color(0xff2C2D2E),
                    fontWeight: FontWeight.w900),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 9.0, bottom: 5),
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
                padding: EdgeInsets.only(left: 9),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/car_ride.svg",
                      width: 17,
                      height: 19.33,
                      color: Color(0xff0C54A1),
                    ),
                    SizedBox(width: 7.37),
                    Expanded(
                      child: Text(
                        "Под заказ, доставим в Бишкек 24 - 31 октября",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Color(0xff0C54A1),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            fontFamily: "RobotoThin"),
                      ),
                    ),
                    SizedBox(width: 7.37),
                  ],
                )),
            Row(
              children: [
                SizedBox(width: 9.00),
                Expanded(
                  child: widgets.addCartButton(
                    onPressed: () {},
                    text: 'to_cart'.tr,
                  ),
                ),
                SizedBox(width: 9.00),
                widgets.addFavorite(
                  onPressed: () {},
                ),
                SizedBox(width: 9.00),
              ],
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }
}
