import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/app_router.dart';
import '../../models/product.dart';
import '../../styles.dart';
import '../../models/app_banner.dart';
import '../widgets.dart' as widgets;

class DiscountSwipeWidget extends StatelessWidget {
  final double height;
  final EdgeInsets? margin;
  final String image;

  DiscountSwipeWidget({this.height = 70, this.margin, required this.image});

  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {

          widgets.scaleImageSheet(context: context, image: image);
        },
        child: Container(
          height: height,
          child:  Stack(children: [
                  Swiper(
                    itemBuilder: (context, index) {
                      return CachedNetworkImage(
                          imageUrl: image, fit: BoxFit.cover);
                    },
                    itemCount: 3,
                    controller: SwiperController(),
                    onIndexChanged: (index) {
                      currentIndex.value = index;
                    },
                    autoplay: false,
                  ),
                  Align(
                    alignment: Alignment(-0.9, 0.9),
                    child: Container(
                      width: 55,
                      height: 25,
                      child: Center(
                          child: Text(
                        "- 55%",
                        style: widgets.robotoConsid(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Color(0xffFF0000),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.5, 0.9),
                    child: Container(
                      width: 43,
                      height: 25,
                      child: Center(
                          child: Text(
                        "hit".tr.toUpperCase() + "!",
                        style: widgets.robotoConsid(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                      decoration: BoxDecoration(
                          color: Color(0xffFF9C09),
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ),
                  Align(
                      alignment: Alignment(0, 1.2),
                      child: Container(
                        width: 80,
                        height: 50,
                        child: widgets.indicatorDots(
                            currentIndex: currentIndex.value, length: 3),
                      )),
                  Obx(() {
                    return Align(
                      alignment: Alignment(0.8, 0.9),
                      child: Container(
                        width: 43,
                        height: 25,
                        child: Center(
                            child: Text(
                          "${currentIndex.value + 1}/3",
                          style: widgets.robotoConsid(
                              color: Color(0xff62656A),
                              fontWeight: FontWeight.bold),
                        )),
                        decoration: BoxDecoration(
                            color: Color(0xffECECEC),
                            borderRadius: BorderRadius.circular(2)),
                      ),
                    );
                  }),
                ]),
        ),
      );
    });
  }
}
