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

class DiscountSwipeWidgetOffline extends StatelessWidget {
  final double height;
  final double alignUp;
  final EdgeInsets? margin;
  final String image;

  DiscountSwipeWidgetOffline(
      {this.height = 80, this.margin, required this.image,  this.alignUp = 1.2});

  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: height.w,
        margin: margin ?? EdgeInsets.only(top: 13),
        child:  Stack(children: [
                Swiper(
                  itemBuilder: (context, index) {
                    return Image.asset(image);
                  },
                  itemCount: 3,
                  controller: SwiperController(),
                  onIndexChanged: (index) {
                    currentIndex.value = index;
                  },
                  autoplay: false,
                ),

                Align(
                    alignment: Alignment(0,alignUp),
                    child: widgets.indicatorDotsOffline(
                        currentIndex: currentIndex.value, length: 3)),

              ]),
      );
    });
  }
}
