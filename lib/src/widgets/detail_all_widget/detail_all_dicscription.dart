import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/pages/detail_all/detail_all_controller.dart';

import '../../models/news_list.dart';

import '../widgets.dart' as widgets;

class DetailAllDiscriptionWidget extends StatelessWidget {
  DetailAllDiscriptionWidget({Key? key, required this.price}) : super(key: key);
  final int? price;
  final controller = Get.put(DetalAllController());

  @override
  Widget build(BuildContext context) {
    return widgets.boxShadows(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "${controller.getPrice(price)} с",
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
              widgets.strikeThroughWidget(
                top: 7,
                child: Text(
                  "${controller.getPrice(price)} с",
                  style: widgets.robotoConsid(
                      color: Color(
                        0xffCCCCCC,
                      ),
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
                length: controller.getPrice(price).length, fontSize: 15,
              ),
              Spacer(),
              widgets.anySvg(nameSvg: 'share', size: Size(27, 27)),
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
          Text(
            "minimum_order".tr,
            style: widgets.robotoConsid(),
          )
        ],
      ),
    );
  }
}
