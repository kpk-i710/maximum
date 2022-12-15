import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:maxkgapp/src/pages/discounts/discount_card_page_controller.dart';
import '../../models/dicount_list_model.dart';
import '../../styles.dart';
import 'package:get/get.dart';
import '../../widgets/widgets.dart' as widgets;

class DiscountCartDiscription extends StatelessWidget {
  DiscountCartDiscription({Key? key, this.product}) : super(key: key);
  final Product? product;
  final controller = Get.put(DicountCardPageController());

  @override
  Widget build(BuildContext context) {
    return widgets.boxShadows(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${product?.price} с.",
                style: widgets.robotoConsid(
                    color: Color(
                      0xff991A4E,
                    ),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "${product?.price} с.",
                style: widgets.robotoConsid(
                    color: Color(
                      0xffCCCCCC,
                    ),
                    decoration: (TextDecoration.lineThrough),
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Код товара:",
                  style: widgets.robotoConsid(
                    color: Color(
                      0xff70757A,
                    ),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: ' 1254261',
                        style: widgets.robotoConsid(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff112B66))),
                  ],
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 15,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 2,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              Text("0 отзывов",
                  style: widgets.robotoConsid(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff70757A))),
            ],
          ),
          SizedBox(height: 24),
          Text(
            "expample_card".tr,
            style: widgets.robotoConsid(),
          ),
          SizedBox(height: 33),
          Row(
            children: [
              SizedBox(
                child: VerticalDivider(
                  width: 2,
                  thickness: 2,
                  color: Color(0xff112B66),
                ),
                width: 5,
                height: 83,
              ),
              SizedBox(width: 15),
              SvgPicture.asset(
                "assets/icons/car_ride.svg",
                width: 17,
                height: 19.33,
                color: Color(0xff0C54A1),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "availability_and_delivery".tr,
                      style: widgets.robotoConsid(color: Color(0xff70757A)),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "delivery_period".tr,
                      style: widgets.robotoConsid(),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "free_shipping".tr,
                      style: widgets.robotoConsid(
                          color: Color(0xff991A4E), fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          widgets.additionalService(),
          SizedBox(height: 35),
          Obx(() {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1.0),
              child: Row(
                children: [
                  widgets.favoriteWithPrice(price: product?.price),
                  controller.isAddedToCard.value == true
                      ? Row(
                          children: [
                            widgets.dark(
                              radius: 5,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  children: [
                                    buttonCounter(
                                        text: "-",
                                        onTap: () {
                                          controller.minus();
                                        }),
                                    Container(
                                      width: 50,
                                      child: Center(
                                        child: Text(
                                          controller.counter.value.toString(),
                                          style: widgets.robotoConsid(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ),
                                    buttonCounter(
                                        text: "+",
                                        onTap: () {
                                          controller.plus();
                                        }),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff112B66),
                                Color(0xff991A4E)
                              ]),
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton.icon(
                            onPressed: () {
                              controller.isAddedToCard.value = true;
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                shadowColor: Colors.transparent),
                            icon: Icon(Icons.shopping_cart),
                            label: Text(
                              'to_cart'.tr.toUpperCase(),
                              style: widgets.robotoConsid(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                ],
              ),
            );
          }),
          SizedBox(height: 15),
          Text(
            "minimum_order".tr,
            style: widgets.robotoConsid(),
          )
        ],
      ),
    );
  }

  Widget buttonCounter({
    required String text,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            border: Border.all(
              color: Color(0xffCCCCCC),
              width: 1,
            )),
        width: 35,
        height: 35,
        child: Center(
          child: Text(
            text,
            style: widgets.robotoConsid(
                color: AppTextStyles.colorBlueMy, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
