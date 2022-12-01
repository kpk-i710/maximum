import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/dicount_list_model.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widgets/bought_today/bought_today_grid_widget.dart';
import '../../widgets/brand_offers/brand_offers_grid_widget.dart';
import '../../widgets/discount_widgets/discount_cart_discription.dart';
import '../../widgets/discount_widgets/discount_cart_help.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../widgets/discount_widgets/discount_swipe_widget.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../home/home_page_controller.dart';
import 'discount_card_page_controller.dart';

class DiscountCardPage extends StatelessWidget {
  final c = Get.put(DicountCardPageController());
  final Product? product;
  final homeController = Get.put(HomePageController());

  DiscountCardPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar2(title: Get.arguments['title']),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DiscountSwipeWidget(
                    image:
                        "https://max.kg/nal/img/${product?.idPost}/b_${product?.img}"),
                SizedBox(height: 20),
                DiscountCartDiscription(product: product),
                SizedBox(height: 22),
                DiscoiuntCartHelp(),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "description".tr.toUpperCase(),
                  style: widgets.robotoConsid(fontWeight: FontWeight.bold,),
                ),
                SizedBox(
                  height: 5,
                ),
                ExpandText(
                  expandOnGesture: true,
                  maxLines: 3,
                  "expample_card2".tr,
                  style: widgets.robotoConsid(color: Color(0xff000000)),
                  indicatorBuilder: (context, onTap, expanded) => InkWell(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: widgets.underLineDashed(
                            child: Text(
                          !expanded ? "more".tr : "collapse".tr,
                          style: widgets.robotoConsid(color: Color(0xff142A65)),
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
                  style: widgets.robotoConsid(color: Color(0xff000000)),
                  indicatorBuilder: (context, onTap, expanded) => InkWell(
                      onTap: onTap,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: widgets.underLineDashed(
                            child: Text(
                          !expanded ? "more".tr : "collapse".tr,
                          style: widgets.robotoConsid(color: Color(0xff142A65)),
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
                  controller: c.controller,
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
                    Text("instruction".tr,style: widgets.robotoConsid(),),
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
                    Text("instruction".tr,style: widgets.robotoConsid(),),
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
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold),
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
                    "expample_card4".tr,style: widgets.robotoConsid(),
                  ),
                ),
                SizedBox(height: 20),
                widgets.writeFeedbackButton(
                    text: 'write_feedback'.tr, onPressed: () {}),
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
                          style: widgets.robotoConsid(color: Color(0xff142A65)),
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
                        Text("all_products_category".tr,style: widgets.robotoConsid(),),
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
                        icon: 'car_ride', label: 'delivery_methods', index: 0),
                    SizedBox(height: 12),
                    widgets.arrowButton(
                        icon: 'wallet',
                        label: 'payment_сonvenient_way',
                        index: 1),
                    SizedBox(height: 12),
                    widgets.arrowButton(
                        icon: 'safely', label: 'buyer_warranties', index: 1),
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
                widgets.writeFeedbackButton(
                    text: 'show_more2'.tr, onPressed: () {}),
                SizedBox(height: 46),
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
        ));
  }
}
