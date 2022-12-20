import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:sizer/sizer.dart';

import '../helpers/app_router.dart';
import '../styles.dart';
import '../models/app_banner.dart';
import '../widgets/widgets.dart' as widgets;

class BannerWidget extends StatelessWidget {
  final double height;
  final EdgeInsets? margin;
  final List<AppBanner> list;

  BannerWidget({this.height = 45, this.margin, required this.list});

  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.w,
      margin: margin ?? EdgeInsets.only(top: 0),
      child: list.isEmpty
          ? widgets.blockPlaceholder()
          : Stack(children: [
              Swiper(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(
                        AppRouter.listBanners,
                        arguments: {
                          "idBanners": list[index].id,
                        },
                      );
                    },
                    child: CachedNetworkImage(
                        imageUrl: list[index].bigImage, fit: BoxFit.fill),
                  );
                },
                itemCount: list.length,
                controller: SwiperController(),
                onIndexChanged: (index) {
                  currentIndex.value = index;
                },
                autoplay: list.isNotEmpty,
              ),
              Align(
                alignment: Alignment(0, 1.2),
                child: SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < list.length; i++)
                        Obx(() => AnimatedContainer(
                              duration: Duration(seconds: 1),
                              height: 10,
                              width: 10,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  color: currentIndex.value == i
                                      ? context.theme.primary
                                      : context.theme.grey,
                                  borderRadius: BorderRadius.circular(16)),
                            ))
                    ],
                  ),
                ),
              ),
            ]),
    );
  }
}
