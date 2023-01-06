import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../widgets/widgets.dart' as widgets;
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:maxkgapp/src/models/news.dart';

class PromotionsSwiperWidget extends StatelessWidget {
  final List<News1> list;
  final homeController = Get.put(HomePageController());

  PromotionsSwiperWidget({required this.list});

  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          Get.toNamed(
            AppRouter.betweenAllPage,
            arguments: {
              "idNews": homeController.newsList[currentIndex.value].id,
            },
          );
        },
        child: Container(
          height: 200,
          child: list.isEmpty
              ? widgets.blockPlaceholder()
              : Stack(children: [
                  Swiper(
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: CachedNetworkImage(
                            imageUrl: homeController.newsList[index].logoUrl!,
                            fit: BoxFit.fill),
                      );
                    },
                    itemCount: list.length > 5 ? 5 : list.length,
                    controller: SwiperController(),
                    onIndexChanged: (index) {
                      currentIndex.value = index;
                    },
                    autoplay: list.isNotEmpty,
                  ),
                  Align(
                    alignment: Alignment(0.9, 0.9),
                    child: Container(
                        decoration: BoxDecoration(
                          color: AppTextStyles.colorGreyThrou,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7.0, vertical: 5),
                          child: Text(
                            "${currentIndex.value + 1}/${list.length > 5 ? 5 : list.length}",
                            style: widgets.robotoConsid(
                                color: AppTextStyles.colorGrayMy,fontSize: 12
                            ),
                          ),
                        )),
                  ),
                  Align(
                      alignment: Alignment(0, 1.2),
                      child: widgets.indicatorDots(
                          currentIndex: currentIndex.value,
                          length: list.length)),
                ]),
        ),
      );
    });
  }
}
