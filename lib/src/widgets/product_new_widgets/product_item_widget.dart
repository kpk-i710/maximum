import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {Key? key,  this.index})
      : super(key: key);



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
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      child: Text(
                        ' - 20%',
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
            SizedBox(
              height: 2,
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
                    "46 850 сом",
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
                  onPressed: () {}, context: context,
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