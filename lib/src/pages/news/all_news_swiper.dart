import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/models/news.dart';
import 'package:maxkgapp/src/pages/between_pages_all/between_all_pages.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/pages/news/all_news_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class AllNewsSwiper extends StatelessWidget {
  AllNewsSwiper({required this.list});

  final controllerWidget = Get.put(WidgetsControllers());
  final List<News1> list;
  final homeController = Get.put(HomePageController());
  final currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          Get.to(
            BetweenAllPages(
              title: homeController.newsList[currentIndex.value].title,
            ),
            arguments: {
              "idNews": homeController.newsList[currentIndex.value].id,
            },
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              child: list.isEmpty
                  ? widgets.blockPlaceholder()
                  : Stack(children: [
                      Swiper(
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: CachedNetworkImage(
                                imageUrl:
                                    homeController.newsList[index].logoUrl!,
                                fit: BoxFit.cover),
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
                                    color: AppTextStyles.colorGrayMy,
                                    fontSize: 12),
                              ),
                            )),
                      ),
                      Align(
                          alignment: Alignment(0, 1),
                          child: widgets.indicatorDots(
                              currentIndex: currentIndex.value,
                              length: list.length)),
                    ]),
            ),
            list.isNotEmpty
                ? Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            homeController.newsList[currentIndex.value].title!,
                            style: widgets.robotoConsid(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "${controllerWidget.getDate(homeController.newsList[currentIndex.value].date!)} ",
                            style: widgets.robotoConsid(
                                fontSize: 14, color: AppTextStyles.colorGrayMy),
                          ),
                        ],
                      ),
                      Spacer(),
                      Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: widgets.share()),
                    ],
                  )
                : SizedBox(),
            SizedBox(height: 10),
          ],
        ),
      );
    });
  }
}
