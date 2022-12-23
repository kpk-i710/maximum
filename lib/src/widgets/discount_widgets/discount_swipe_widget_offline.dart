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
  final EdgeInsets? margin;
  final String image;

  DiscountSwipeWidgetOffline(
      {this.height = 80, this.margin, required this.image});

  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: height.w,
        margin: margin ?? EdgeInsets.only(top: 13),
        child: false
            ? widgets.blockPlaceholder()
            : Stack(children: [
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
                    alignment: Alignment(0, 1.2),
                    child: widgets.indicatorDotsOffline(
                        currentIndex: currentIndex.value, length: 3)),
                // Obx(() {
                //   return Align(
                //     alignment: Alignment(0.8, 0.87),
                //     child: Container(
                //
                //       child: Padding(
                //         padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 4),
                //         child: Text(
                //           "${currentIndex.value + 1}/3",
                //           style: widgets.robotoConsid(
                //         fontSize: 9,
                //           color: Color(0xff62656A),
                //           fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       decoration: BoxDecoration(
                //           color: Color(0xffECECEC),
                //           borderRadius: BorderRadius.circular(2)),
                //     ),
                //   );
                // }),
              ]),
      );
    });
  }
}
