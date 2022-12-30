import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/detail_all/detail_all_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widgets/bought_today/bought_today_grid_widget.dart';
import '../../widgets/brand_offers/brand_offers_grid_widget.dart';
import '../../widgets/detail_all_widget/detail_all_dicscription.dart';
import '../../widgets/detail_all_widget/detail_all_cart_help.dart';
import '../../widgets/discount_widgets/discount_swipe_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../widgets/widgets.dart' as widgets;
import '../home/home_page_controller.dart';

class DetailAll extends StatelessWidget {
  final homeController = Get.put(HomePageController());
  final String? idPost;
  final String? img;
  final int? price;
  final String? naim;

  DetailAll({
    Key? key,
    required this.idPost,
    required this.img,
    required this.price,
    required this.naim,
  }) : super(key: key);
  final controller = Get.put(DetalAllController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar2(title: Get.arguments['title'],fontWeight: FontWeight.bold,),
        bottomNavigationBar: widgets.bottomNavigation(
            currentTab: 0, onSelectTab: homeController.tabSelect),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DiscountSwipeWidget(
                        image: "https://max.kg/nal/img/${idPost}/b_${img}"),
                    SizedBox(height: 20),
                    DetailAllDiscriptionWidget(
                      price: price ?? 0,
                    ),
                    SizedBox(height: 22),
                    DetailCartHelp(),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      "description".tr.toUpperCase(),
                      style: widgets.robotoConsid(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ExpandText(
                      expandOnGesture: true,
                      maxLines: 3,
                      "expample_card2".tr,
                      style: widgets.robotoConsid( fontSize: 14, height:    1.25),
                      indicatorBuilder: (context, onTap, expanded) => InkWell(
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: widgets.underLineDashed(
                                child: Text(
                              !expanded ? "more".tr : "collapse".tr,
                              style: widgets.robotoConsid(
                                color: AppTextStyles.colorBlueMy,

                              ),
                            )),
                          )),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      "characteristics".tr.toUpperCase(),
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    ExpandText(
                      expandOnGesture: true,
                      maxLines: 3,
                      "expample_card3".tr,
                      style: widgets.robotoConsid( fontSize: 14, height:    1.25),
                      indicatorBuilder: (context, onTap, expanded) => InkWell(
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: widgets.underLineDashed(
                                child: Text(
                              !expanded ? "more".tr : "collapse".tr,
                              style: widgets.robotoConsid(

                                  color: Color(0xff142A65)),
                            )),
                          )),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "video".tr.toUpperCase(),
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 14),
                    YoutubePlayer(
                      controller: controller.controller,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                              playedColor: Colors.red, handleColor: Colors.red),
                        )
                      ],
                    ),
                    SizedBox(height: 57),
                    Text(
                      "documents".tr.toUpperCase(),
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/pdf.png',
                          width: 29,
                        ),
                        SizedBox(width: 9),
                        Text(
                          "instruction".tr,
                          style: widgets.robotoConsid(),
                        ),
                        Spacer(),
                        widgets.underLine(
                            child: Text(
                              "download".tr,
                              style: widgets.robotoConsid(
                                color: Color(0xff0C54A1),
                              ),
                            ),
                            hight: 0),
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/pdf.png',
                          width: 29,
                        ),
                        SizedBox(width: 9),
                        Text(
                          "instruction".tr,
                          style: widgets.robotoConsid(),
                        ),
                        Spacer(),
                        widgets.underLine(
                            child: Text(
                              "download".tr,
                              style: widgets.robotoConsid(
                                color: Color(0xff0C54A1),
                              ),
                            ),
                            hight: 0),
                      ],
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    Row(
                      children: [
                        Text(
                          "reviews".tr.toUpperCase() + " /",
                          style:
                              widgets.robotoConsid(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 13),
                        RatingBar.builder(
                          initialRating: 4,
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
                      ],
                    ),
                    SizedBox(height: 6),
                    Center(
                      child: Text(
                        "expample_card4".tr,
                        style: widgets.robotoConsid(),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                      child: widgets.OrderPayButton(
                          text: 'leave_feedback'.tr,
                          fontSize: 15,
                          onPressed: () {
                            widgets.leaveFeedback(context: context);
                          }),
                    ),
                    SizedBox(height: 30),
                    ExpandChild(
                      collapsedVisibilityFactor: 0.6,
                      indicatorBuilder: (context, onTap, expanded) => InkWell(
                          onTap: onTap,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: widgets.underLineDashed(
                                child: Text(
                              !expanded ? "more".tr : "collapse".tr,
                              style: widgets.robotoConsid(
                                  color: Color(0xff142A65)),
                            )),
                          )),
                      child: Column(
                        children: [
                          widgets.userFeedback(),
                          widgets.userFeedback(),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    widgets.boxShadows(
                        child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "all_products_category".tr,
                              style: widgets.robotoConsid(),
                            ),
                            Row(
                              children: [
                                widgets.underLineDashed(
                                    child: Text(
                                  "Ноутбуки".tr,
                                  style: widgets.robotoConsid(
                                      color: Color(0xff142A65), height: 2),
                                )),
                                SizedBox(width: 6),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14.0),
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 12,
                                    color: Color(0xff142A65),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Spacer(),
                        Image.asset(
                          "assets/images/imagePc.png",
                          width: 60,
                          height: 60,
                        ),
                      ],
                    )),
                    SizedBox(height: 31),
                    Column(
                      children: [
                        widgets.arrowButton(
                            icon: 'car_ride',
                            label: 'delivery_methods',
                            index: 0),
                        SizedBox(height: 12),
                        widgets.arrowButton(
                            icon: 'wallet',
                            label: 'payment_сonvenient_way',
                            index: 1),
                        SizedBox(height: 12),
                        widgets.arrowButton(
                            icon: 'safely',
                            label: 'buyer_warranties',
                            index: 1),
                      ],
                    ),
                    SizedBox(height: 46),
                    Text(
                      "similar_products".tr.toUpperCase() + " /",
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 23),
                    Obx(() => BrandOffersGridWidget(
                          list: homeController.discountList.value,
                        )),
                    SizedBox(height: 20),
                    Text(
                      "you_watched".tr.toUpperCase() + " /",
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 18),
                    Obx(() => BoughtTodayGridWidget(
                          list: homeController.discountList.value,
                        )),
                  ],
                ),
              ),
            ),
            widgets.floatingCard(
                context: context, price: price ?? 0, name: naim),
          ],
        ));
  }
}
