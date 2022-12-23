import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../models/dicount_list_model.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class DiscountDetailItemWidget extends StatelessWidget {
  Product? product;
  VoidCallback onPress;
  final index;

  DiscountDetailItemWidget(
      {super.key, required this.product, required this.onPress, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, ),
      child: GestureDetector(
        onTap: onPress,
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
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  height: 180,
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl:
                            "https://max.kg/nal/img/${product?.idPost}/b_${product?.img}",
                        fit: BoxFit.cover,
                        progressIndicatorBuilder: (context, url, progress) {
                          return CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  context.theme.primary),
                              value: progress.totalSize != null
                                  ? progress.downloaded / progress.totalSize!
                                  : null);
                        },
                      ),
                      Align(
                        alignment: Alignment(-0.8, 0.6),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xff991A4E),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          child: Text(
                            '- ${product?.discountPrc}%',
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
              ),
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 9.0, bottom: 5),
                      child: AutoSizeText(
                        product?.naim.toString() ?? "",
                        maxFontSize: 14,
                        minFontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontFamily: "RobotoCondensed-Regular",
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 9.0),
                          child: AutoSizeText(
                            "${product?.cenaok.toString()} с",
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
                            "${product?.oldPrice.toString()} с",
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
                    SizedBox(
                      height: 20,
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
                    SizedBox(
                      height: 8,
                    ),
                    widgets.addCardAndFavorite(
                        textCard: 'to_cart'.tr,
                        onPressedCard: () {},
                        isSelectedFavorite: index == 0 ? true : false),
                    SizedBox(
                      height: 8,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
