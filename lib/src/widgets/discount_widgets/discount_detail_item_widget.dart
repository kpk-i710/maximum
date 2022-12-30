import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/discounts/discount_list_page/discount_page_list_view/discount_page_list_view_controller.dart';
import 'package:maxkgapp/src/widgets/discount_widgets/discount_swipe_widget_offline.dart';
import '../../models/dicount_list_model.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class DiscountDetailItemWidget extends StatelessWidget {
  Product? product;
  VoidCallback onPress;
  final index;

  DiscountDetailItemWidget(
      {super.key, required this.product, required this.onPress, this.index});

  final controller = Get.put(DiscountPageNewController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          height: 180,
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
                flex: 3,
                child: Container(
                  height: 180,
                  child: Stack(
                    children: [
                      DiscountSwipeWidgetOffline(
                          image: "assets/images/sofa.png"),
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
                flex: 4,
                child: Column(
                  children: [
                    SizedBox(
                      height: 13,
                    ),
                    widgets.titleDescrpPriceWithoutCar(
                      price: controller.getPrice(product?.cenaok),
                      title: product?.naim.toString(),
                      oldPrice: controller.getPrice(product?.oldPrice),
                    ),
                    Spacer(),
                    widgets.addCardAndFavoriteAndCar(
                        textCard: 'to_cart'.tr,
                        onPressedCard: () {},
                        isSelectedFavorite: index == 1 ? true : false,
                        context: context),
                    SizedBox(
                      height: 10,
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
