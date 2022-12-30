import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/detail_all/detail_all_controller.dart';
import 'package:maxkgapp/src/pages/intro/intro_controller.dart';
import 'package:maxkgapp/src/pages/orders_history/order_history_page_controller.dart';
import 'package:maxkgapp/src/pages/shopping_cart/shopping_cart_page.dart';
import 'package:maxkgapp/src/pages/user/profile_params/profile_params_page_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../helpers/app_router.dart';
import '../models/country_code.dart';
import '../helpers/helper.dart';
import '../helpers/prefs.dart';
import '../pages/auth/auth_page/auth_page_controller.dart';
import '../pages/current_orders/order_page/order_page.dart';
import '../pages/discounts/discount_card_page_controller.dart';
import '../pages/news/all_news_controller.dart';
import '../pages/shopping_cart/before_payment_delivry/before_payment_delivry_controller.dart';
import '../pages/shopping_cart/before_payment_delivry/shipping_methods/change_address/change_address_controller.dart';
import '../pages/shopping_cart/before_payment_delivry/shipping_methods/shipping_methods_controller.dart';
import '../pages/shopping_cart/shopping_cart_page_controller.dart';
import '../pages/user/add_phone/add_phone_page_controller.dart';
import '../pages/user/personal_data/personal_data_page_controller.dart';
import 'orders_widgets/time_line_horizontal.dart';
import '../styles.dart';
import 'app_icon.dart';
import 'orders_widgets/time_line_vertical.dart';
import '../models/news.dart';
import 'widgets_controller.dart';
import '../widgets/widgets.dart' as widgets;
import 'package:badges/badges.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'dart:math' as math;

Widget priceWidget(double price, {TextStyle? style}) {
  if (style != null) {
    style = style.merge(robotoConsid(fontSize: style.fontSize ?? 0 + 2));
  }
  try {
    if (price == 0) {
      return Text('-', style: style ?? Get.theme.textTheme.subtitle1);
    }
    return RichText(
      softWrap: false,
      overflow: TextOverflow.fade,
      maxLines: 1,
      text: Prefs.currencyRight != null && Prefs.currencyRight == true
          ? TextSpan(
              text: Prefs.defaultCurrency,
              style: style ?? Get.theme.textTheme.subtitle1,
              children: <TextSpan>[
                TextSpan(
                    text: price.toStringAsFixed(2),
                    style: style ?? Get.theme.textTheme.subtitle1),
              ],
            )
          : TextSpan(
              text: price.toStringAsFixed(2) + ' ',
              style: style ?? Get.theme.textTheme.subtitle1,
              children: <TextSpan>[
                TextSpan(
                  text: Prefs.defaultCurrency,
                  style: robotoConsid(
                      fontWeight: FontWeight.w600,
                      fontSize: style != null
                          ? style.fontSize ?? 0 - 4
                          : Get.theme.textTheme.subtitle1!.fontSize! - 4),
                ),
              ],
            ),
    );
  } catch (e) {
    return Text('');
  }
}

Widget imagePng({required String name}) {
  return Image.asset(
    'assets/icons/$name',
    scale: 0.8,
  );
}

Widget SwiperImage({required String image}) {
  var currentIndex = 0.obs;
  return Obx(() {
    return Container(
      height: Get.width - 40,
      child: Stack(children: [
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
            alignment: Alignment(0, 0.9),
            child: widgets.indicatorDots(
                currentIndex: currentIndex.value, length: 3)),
      ]),
    );
  });
}

Widget indicatorDots({required int length, required int currentIndex}) {
  return SizedBox(
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < (length > 5 ? 5 : length); i++)
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 7,
            width: currentIndex == i ? 20 : 10,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: currentIndex == i
                    ? AppTextStyles.colorRedMy
                    : AppTextStyles.colorGreyThrou,
                borderRadius: BorderRadius.circular(16)),
          )
      ],
    ),
  );
}

Widget indicatorDotsOffline({required int length, required int currentIndex}) {
  return SizedBox(
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < (length > 5 ? 5 : length); i++)
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 5,
            width: currentIndex == i ? 10 : 5,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
                color: currentIndex == i
                    ? AppTextStyles.colorRedMy
                    : AppTextStyles.colorGreyThrou,
                borderRadius: BorderRadius.circular(16)),
          )
      ],
    ),
  );
}

Widget homeButton({
  required String icon,
  required String text,
  String? page,
}) {
  return boxShadows(
    padding: 0,
    child: customButton(
      child: Container(
        height: 50,
        child: Row(
          children: [
            SizedBox(width: 15),
            anySvg(nameSvg: '$icon', size: Size(20, 20)),
            SizedBox(width: 15),
            Text(
              "$text".tr,
              style: robotoConsid(),
            ),
          ],
        ),
      ),
      onTap: () {
        if (page != null) {
          Get.toNamed(page);
        }
      },
    ),
  );
}

void leaveFeedback({required BuildContext context}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return leaveFeedbackSheet(
          context: context,
        );
      });
}

Widget leaveFeedbackSheet({
  required BuildContext context,
}) {
  return getThemeBorderGreyTextFild(
    child: boxShadows(
        padding: 8,
        radius: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).viewInsets.bottom + 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                        color: Color(0xffE4E4E4),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(child: raitingEmodjy(onTap: (value) {})),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  minLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                OrderPayButton(
                    text: 'send'.tr,
                    fontSize: 15,
                    onPressed: () {
                      Get.back();
                    }),
                SizedBox(
                  height: MediaQuery.of(context).viewInsets.bottom,
                )
              ],
            ),
          ),
        )),
  );
}

Widget inkButton({Function()? onTap, required Widget child}) {
  return Padding(
    padding: const EdgeInsets.only(right: 5.0, bottom: 20),
    child: SizedBox.fromSize(
      size: Size(50, 50),
      child: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              splashColor: Colors.grey,
              onTap: onTap,
              child: Center(child: child)),
        ),
      ),
    ),
  );
}

Widget colorCustomButton(
    {required Widget child,
    required Function()? onTap,
    double height = 35,
    double width = 35,
    Color color = Colors.white}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Ink(
            width: width,
            height: height,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(5)),
            child: Center(child: child))),
  );
}

Widget gradientCustomButton(
    {required Widget child, required Function()? onTap, double height = 35}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Ink(
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
                  0.0,
                  0.8,
                ], colors: [
                  Color(0xff112B66),
                  Color(0xff53235A),
                ])),
            child: Center(child: child))),
  );
}

Widget customButton({required Widget child, required Function()? onTap}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
        splashColor: Colors.grey,
        onTap: onTap,
        child: Ink(child: Center(child: child))),
  );
}

Widget customButtonOval({required Widget child, required Function() onTap}) {
  return SizedBox.fromSize(
    size: Size(50, 50),
    child: ClipOval(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            splashColor: Colors.grey,
            onTap: onTap,
            child: Center(child: child)),
      ),
    ),
  );
}

Widget notificationAll(
    {required BuildContext context,
    required String time,
    required String description,
    Function()? onTap}) {
  return GestureDetector(
    onTap: () {
      showModalBottomSheet(
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (context) {
            return fullReadNoty(
              context: context,
              time: time,
              description: description,
            );
          });
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: boxShadows(
          child: Column(
        children: [
          SizedBox(height: 5),
          Row(
            children: [
              Text(
                "$time",
                style: robotoConsid(color: AppTextStyles.colorGrayMy),
              ),
              Spacer(),
              if (onTap != null)
                inkButton(
                    child: anySvg(nameSvg: 'close', size: Size(17, 17)),
                    onTap: onTap)
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              "time_delivery".tr,
              style: robotoConsid(color: AppTextStyles.colorGrayMy),
            ),
          ),
          SizedBox(height: 20),
        ],
      )),
    ),
  );
}

Widget fullReadNoty(
    {required BuildContext context,
    required String time,
    required String description}) {
  return boxShadows(
      padding: 8,
      radius: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          height: Get.height / 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Color(0xffE4E4E4),
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 30),
              Text(
                time,
                style: robotoConsid(),
              ),
              SizedBox(height: 30),
              Text(
                description.tr + "\n" + description.tr,
                style: robotoConsid(fontSize: 15),
              ),
            ],
          ),
        ),
      ));
}

Widget buttonCounterTest({
  required String text,
  required Function() onTap,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: Colors.white,
    ),
    width: 25,
    height: 25,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        child: Center(
          child: Text(
            text,
            style: robotoConsid(color: AppTextStyles.colorBlueMy, fontSize: 15),
          ),
        ),
      ),
    ),
  );
}

Widget buttonCounter({
  required String text,
  required Function() onTap,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.white,
        border: Border.all(
          color: Color(0xffCCCCCC),
          width: 1,
        )),
    width: 35,
    height: 35,
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.grey,
        child: Center(
          child: Text(
            text,
            style: robotoConsid(color: AppTextStyles.colorBlueMy, fontSize: 20),
          ),
        ),
      ),
    ),
  );
}

Widget counterCardManyProduct({required BuildContext context}) {
  final controller = Get.put(DicountCardPageController());
  return Row(
    children: [
      dark(
        width: Get.width / 2.1,
        height: 52,
        radius: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              buttonCounter(
                  text: "-",
                  onTap: () {
                    controller.minus(context: context);
                  }),
              Spacer(),
              Text(
                controller.counter.value.toString(),
                style: robotoConsid(color: Colors.white, fontSize: 18),
              ),
              Spacer(),
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
  );
}

Widget counterCardRuntime(
    {int? price, Function()? onTap, required BuildContext context}) {
  final controller = Get.put(DicountCardPageController());
  return Obx(() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          favoriteWithPrice(price: price, context: context),
          if (controller.counter.value > 1)
            counterCardManyProduct(context: context),
          if (controller.counter.value == 1)
            counterCardOneProduct(context: context),
          if (controller.counter.value == 0) cardButton(onTap: onTap),
        ],
      ),
    );
  });
}

void showOptionCountProduct(
    {required BuildContext context, required String name}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return optionCountProductSheet(context: context, name: name);
      });
}

Widget optionCountProductSheet(
    {required BuildContext context, required String name}) {
  return Obx(() {
    return boxShadows(
      padding: 8,
      radius: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height / 1.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Color(0xffE4E4E4),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            inkButton(
                onTap: () {
                  Get.back();
                },
                child: anySvg(nameSvg: 'close', size: Size(17, 17))),
            productWidgetOption(context: context),
          ],
        ),
      ),
    );
  });
}

Widget productWidgetOption({required BuildContext context}) {
  final controller = Get.put(WidgetsControllers());
  return Expanded(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/notebook_item.png',
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'expample_card6'.tr,
                    style: robotoConsid(color: Color(0xff62656A)),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        controller.getPrice(2000) + " с",
                        style: robotoConsid(
                            color: Color(0xff494949),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      strikeThrough(
                        child: Text(
                          controller.getPrice(3200) + "с",
                          style: robotoConsid(
                            color: AppTextStyles.colorGreyThrou,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "кол-во: 50 шт.= 10 000 с.",
                      style: robotoConsid(color: Color(0xff70757A)),
                    ),
                  ),
                  SizedBox(height: 17),
                  Row(
                    children: [
                      SizedBox(width: 2),
                      anySvg(nameSvg: 'car_blue'),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text("when_coming_delivry".tr,
                            maxLines: 2,
                            style: robotoConsid(
                                color: AppTextStyles.colorBlueMy,
                                fontSize: 10)),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
        Text(
          'минимальное количество к заказу от 10 шт.',
          style: robotoConsid(
            color: Color(0xff62656A),
          ),
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttonCounterOption(
                text: "-",
                onTap: () {
                  controller.minus();
                }),
            Text(
              controller.counter.value.toString(),
              style: robotoConsid(color: Color(0xff494949), fontSize: 18),
            ),
            buttonCounterOption(
                text: "+",
                onTap: () {
                  controller.plus();
                }),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: orderButton(
              text: 'continue_checkout'.tr.toUpperCase(),
              fontSize: 14,
              onPressed: () {
                Get.to(ShoppingCartPage());
              }),
        ),
        Spacer(),
      ],
    ),
  );
}

Widget buttonCounterOption({
  required String text,
  required Function() onTap,
}) {
  return customButton(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppTextStyles.colorGrayDividar,
            width: 1,
          )),
      width: 70,
      height: 70,
      child: Center(
        child: Text(
          text,
          style: robotoConsid(color: AppTextStyles.colorBlackMy, fontSize: 30),
        ),
      ),
    ),
  );
}

void showMassageOneSecondSnackBar(
    {required BuildContext context, required String massgae}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: Duration(milliseconds: 1000),
    margin: EdgeInsets.all(0),
    padding: EdgeInsets.only(
      bottom: 60,
    ),
    content: Container(
      width: Get.width,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 22.0, right: 20, top: 8, bottom: 8),
        child: Text(
          "$massgae".tr,
          textAlign: TextAlign.center,
          style: widgets.robotoConsid(color: Colors.white),
        ),
      ),
      color: AppTextStyles.colorBlackMy,
    ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

Widget counterCardOneProductTest() {
  final controller = Get.put(DicountCardPageController());
  return Obx(() {
    return Expanded(
      child: Row(
        children: [
          Flexible(
            child: dark(
              width: Get.width,
              height: 35,
              radius: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buttonCounterTest(
                        text: "-",
                        onTap: () {
                          controller.minusWithOutSheet();
                        }),
                    Text(
                      controller.counter.value.toString(),
                      style: robotoConsid(color: Colors.white, fontSize: 18),
                    ),
                    buttonCounterTest(
                        text: "+",
                        onTap: () {
                          controller.plus();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  });
}

Widget counterCardOneProduct({required BuildContext context}) {
  final controller = Get.put(DicountCardPageController());
  return Row(
    children: [
      dark(
        width: Get.width / 2.1,
        height: 52,
        radius: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  controller.minus(context: context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  width: 35,
                  height: 35,
                  child: Center(child: anySvg(nameSvg: 'trash_full')),
                ),
              ),
              Spacer(),
              Text(
                controller.counter.value.toString(),
                style: robotoConsid(color: Colors.white, fontSize: 18),
              ),
              Spacer(),
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
  );
}

Widget cardButton({Function()? onTap}) {
  return Container(
    height: 52.0,
    width: Get.width / 2.1,
    decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff112B66), Color(0xff991A4E)]),
        borderRadius: BorderRadius.circular(5)),
    child: ElevatedButton.icon(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent, shadowColor: Colors.transparent),
      icon: anySvg(nameSvg: 'card', color: Colors.white, size: Size(20, 20)),
      label: Text(
        'to_cart'.tr.toUpperCase(),
        style: robotoConsid(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    ),
  );
}

Widget raitingBar({required Function(double value) onTap}) {
  return RatingBar.builder(
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
    onRatingUpdate: onTap,
  );
}

Widget raitingEmodjy({required Function(double rating) onTap}) {
  return RatingBar.builder(
      initialRating: 3,
      itemSize: 50,
      itemCount: 5,
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return iconAndText(
                Icon: Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                ),
                text: "terrible");
          case 1:
            return iconAndText(
                Icon: Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                ),
                text: "badly");
          case 2:
            return iconAndText(
                Icon: Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                ),
                text: "medium");
          case 3:
            return iconAndText(
                Icon: Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                ),
                text: "good");
          case 4:
            return iconAndText(
                Icon: Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                ),
                text: "excellent");
        }
        return Icon(
          Icons.sentiment_very_satisfied,
          color: Colors.green,
        );
      },
      onRatingUpdate: onTap);
}

Widget iconAndText({required Widget Icon, required String text}) {
  return Container(
    child: Column(
      children: [
        Icon,
        SizedBox(height: 2),
        Text(
          "$text".tr,
          style: robotoConsid(fontSize: 7),
        ),
      ],
    ),
  );
}

Widget selectCheckBox({
  required String text,
  required int index,
  required String price,
}) {
  final controller = Get.put(WidgetsControllers());
  return Obx(() {
    return Theme(
      data: ThemeData(toggleableActiveColor: AppTextStyles.colorBlueMy),
      child: GestureDetector(
        onTap: () {
          controller.changeBoxList(index: index);
        },
        child: customButton(
          child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    checkColor: Colors.white,
                    value: controller.checkBoxList[index].isSelected,
                    onChanged: (newValue) {
                      controller.changeBoxList(index: index);
                    },
                  ),
                ),
                SizedBox(width: 15),
                Flexible(
                  child: SizedBox(
                    width: Get.width - 100,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      "$text",
                      style: controller.checkBoxList[index].isSelected
                          ? robotoConsid(color: AppTextStyles.colorBlueMy)
                          : robotoConsid(color: Color(0xff727272)),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  "$price",
                  style: robotoConsid(),
                ),
              ],
            ),
          ),
          onTap: () {
            controller.changeBoxList(index: index);
          },
        ),
      ),
    );
  });
}

Widget additionalService() {
  final controller = Get.put(WidgetsControllers());
  return Obx(() {
    return ListTileTheme(
      contentPadding: EdgeInsets.all(0),
      child: Theme(
          data: ThemeData().copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            onExpansionChanged: (bool expanded) {},
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            trailing: Text(
              controller.checkForServices() ? "500 с." : "0 с",
              style: robotoConsid(fontWeight: FontWeight.bold),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                underLineDashed(
                    child: Text(
                      "additional_services".tr,
                      style: robotoConsid(color: Color(0xff142A65)),
                    ),
                    hight: 3),
                SizedBox(width: 6),
                controller.demoList[1]
                    ? Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff142A65),
                        size: 13,
                      )
                    : anySvg(nameSvg: "arrow_down", size: Size(7, 7)),
                Spacer(),
              ],
            ),
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "assembly_services".tr,
                    style: robotoConsid(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  selectCheckBox(
                      text: 'Теннисный стол Хобби', index: 0, price: '500 с.'),
                  selectCheckBox(
                      text: 'Теннисный стол Хобби', index: 1, price: '200 с.'),
                ],
              )
            ],
          )),
    );
  });
}

Widget titleWidget(
    {required String title,
    double bottom = 10.0,
    double left = 0.0,
    double rightTrailing = 0.0,
    bool isTrailing = false,
    Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: bottom, left: left),
        child: Text(
          '$title'.tr.toUpperCase(),
          style: widgets.robotoConsid(
            fontSize: 16,
          ),
        ),
      ),
      if (isTrailing)
        Expanded(
          child: Row(
            children: [
              Spacer(),
              customButton(
                child: Padding(
                  padding: EdgeInsets.only(
                      bottom: 25.0, left: 20, top: 10, right: rightTrailing),
                  child: widgets.underLineDashed(
                      child: Text(
                    "show_more".tr,
                    style:
                        widgets.robotoConsid(color: AppTextStyles.colorBlueMy),
                  )),
                ),
                onTap: onTap,
              ),
            ],
          ),
        ),
    ],
  );
}

Widget subTitleWidget({
  required String title,
  double bottom = 0.0,
  double left = 0.0,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(bottom: bottom, left: left),
        child: Text(
          '$title'.tr,
          style: widgets.robotoConsid(
            fontSize: 14,
          ),
        ),
      ),
    ],
  );
}

Widget customListTile(
    {String title = '',
    String? suffix,
    String? subtitle,
    textStyle,
    trailing,
    Function()? onTap}) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(color: Get.context!.theme.greyWeak, width: 0.5)),
    padding: EdgeInsets.symmetric(vertical: 5),
    child: ListTile(
      onTap: onTap,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            title,
            style: textStyle ?? robotoConsid(),
          ),
          if (suffix != null) ...[
            const SizedBox(width: 10),
            Text(
              suffix,
              style: robotoConsid(
                color: Get.context!.theme.primary,
              ),
            )
          ]
        ],
      ),
      subtitle: subtitle != null ? Text(subtitle, style: robotoConsid()) : null,
      trailing: trailing ?? Icon(Icons.arrow_forward_ios, size: 22),
    ),
  );
}

Widget DiscountItemWidget(String image) {
  return Container(
    height: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(
        image: CachedNetworkImageProvider(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget newsItemWidget(News1 newss) {
  AllNewsController controllerNewss = Get.put(AllNewsController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: CachedNetworkImageProvider(newss.logoUrl!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            newss.title!,
            style: robotoConsid(fontSize: 17),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Text(
                "${controllerNewss.getDate(newss.date!)} ",
                style: robotoConsid(
                    fontSize: 14, color: AppTextStyles.colorGrayMy),
              ),
              Spacer(),
              Icon(
                Icons.share,
                size: 20,
              ),
              SizedBox(width: 10),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
      Divider(height: 1, color: AppTextStyles.colorGrayDividar),
    ],
  );
}

SizedBox bottomNavigation(
    {int currentTab = 0, Function(int sel)? onSelectTab}) {
  return SizedBox(
    height: 50,
    child: BottomNavigationBar(
      elevation: 10,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppTextStyles.colorBlueMy,
      unselectedItemColor: AppTextStyles.colorGrayMy,
      selectedLabelStyle: widgets.robotoConsid(fontSize: 10),
      unselectedLabelStyle: widgets.robotoConsid(fontSize: 10),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      backgroundColor: Get.context!.theme.background,
      selectedIconTheme: IconThemeData(size: 25),
      unselectedIconTheme: IconThemeData(size: 25),
      currentIndex: currentTab,
      onTap: onSelectTab,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'home'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(currentTab == 1 ? Icons.close : Icons.menu),
          label: 'catalog'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'interesting'.tr,
        ),
        BottomNavigationBarItem(
          icon: cardIcon(isSelected: currentTab == 3),

          // new Icon(Icons.shopping_cart),
          // icon: CartIcon(), // new Icon(Icons.shopping_cart),
          label: 'shopping_cart'.tr,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'profile'.tr,
        ),
      ],
    ),
  );
}

Widget cardIcon({bool isSelected = false}) {
  final controller = Get.put(DicountCardPageController());
  return Badge(
    showBadge: false,
    badgeContent: Padding(
      padding: const EdgeInsets.only(right: 2.0),
      child: RichText(
        text: TextSpan(
          text: " ${controller.counter}",
          style: robotoConsid(color: Colors.white, fontSize: 12),
          children: <TextSpan>[
            TextSpan(
                text: "  ${controller.counter.value}",
                style: TextStyle(fontSize: 0)),
          ],
        ),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.only(bottom: 2.5, top: 2.5),
      child: anySvg(
          nameSvg: 'card',
          color: isSelected
              ? AppTextStyles.colorBlueMy
              : AppTextStyles.colorGrayMy,
          size: Size(22, 22)),
    ),
  );
}

Widget location({required String adress, required Function() onTap}) {
  return customButton(
    onTap: onTap,
    child: Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10, top: 8.0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            adress,
            style: robotoConsid(color: Color(0xff112B66), fontSize: 12),
          ),
          Container(
              decoration: DottedDecoration(
                  shape: Shape.line, dash: [4, 4], color: Color(0xff142A65)),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 1.0, right: 1),
                child: Text(
                  'change'.tr,
                  style: robotoConsid(fontSize: 12, color: Color(0xff142A65)),
                ),
              )),
        ],
      ),
    ),
  );
}

Widget underLineDashed(
    {required Widget child,
    double hight = 1.0,
    Color color = const Color(0xff112B66)}) {
  return Container(
      decoration:
          DottedDecoration(shape: Shape.line, dash: [4, 4], color: color),
      child: Padding(
          padding: EdgeInsets.only(bottom: hight, right: 1), child: child));
}

Widget underLine({required Widget child, double hight = 1.0}) {
  return Container(
      padding: EdgeInsets.only(
        bottom: hight, // Space between underline and text
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Color(0xff0C54A1),
        width: 1.0, // Underline thickness
      ))),
      child: child);
}

Widget rating(double rating, {double iconSize = 15, int quantity = 0}) {
  return Row(
    children: [
      Row(children: Helper.getStarsList(rating, size: iconSize)),
      if (quantity > 0)
        Text(
          ' ($quantity)',
          style:
              robotoConsid(fontWeight: FontWeight.w500, fontSize: iconSize - 3),
        )
    ],
  );
}

void citySelectorSheetAppBar({required BuildContext context}) {
  final controller = Get.put(ShoppingCartPageController());
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: Get.height * 0.7,
                child: Scrollbar(
                  child: ListView(physics: BouncingScrollPhysics(), children: [
                    for (int i = 0; i < controller.citys!.length; i++)
                      customButton(
                        onTap: () {
                          print(controller.citys![i]);
                          controller.selectedCity.value = controller.citys![i];
                          Get.back();
                        },
                        child: ListTile(
                          title: Text(
                            controller.citys![i],
                            style: robotoConsid(),
                          ),
                        ),
                      ),
                  ]),
                )),
          ),
        );
      });
}

void citySelectorSheetWithQuestion({required BuildContext context}) {
  final controller = Get.put(ShoppingCartPageController());
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Padding(
            padding: EdgeInsets.only(bottom: Get.height * 0.1),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: Get.height * 0.7,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
                      child: Text(
                        "choose_city_from_list".tr,
                        style: robotoConsid(fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Scrollbar(
                        child: ListView(
                            physics: BouncingScrollPhysics(),
                            children: [
                              for (int i = 0; i < controller.citys!.length; i++)
                                ListTile(
                                  onTap: () {
                                    print(controller.citys![i]);
                                    controller.selectedCity.value =
                                        controller.citys![i];
                                    Get.back();
                                  },
                                  title: Text(
                                    controller.citys![i],
                                    style: robotoConsid(),
                                  ),
                                ),
                            ]),
                      ),
                    ),
                  ],
                )),
          ),
        );
      });
}

void citySelectorSheet({required BuildContext context}) {
  final controller = Get.put(ShoppingCartPageController());
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Obx(() {
          return Container(
            height: Get.height,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: Get.height * 0.25,
                  left: Get.width * 0.1,
                  right: Get.width * 0.1),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          "choose_city_from_list".tr,
                          style: robotoConsid(),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 55,
                          child: DropdownButtonFormField<String>(
                              hint: Text(
                                "your_city".tr,
                                style: robotoConsid(),
                              ),
                              icon: SizedBox(),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xff112B66), width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Color(0xff112B66),
                                    )),
                                focusColor: Color(0xff112B66),
                              ),
                              value: controller.selectedCity.value,
                              items: controller.citys!
                                  .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: robotoConsid(),
                                      )))
                                  .toList(),
                              onChanged: (item) {
                                print(item);
                                controller.selectedCity.value = item!;
                              }),
                        ),
                        SizedBox(height: 20),
                        saveButton(
                            text: 'checkout'.tr.toUpperCase(),
                            onPressed: () {
                              Get.back();
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
      });
}

Widget bigFullWidthButton(
    {required String text,
    Color? bgColor,
    double radius = 10,
    TextStyle? textStyle,
    Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: bgColor ?? Get.context!.theme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style:
            textStyle ?? robotoConsid(color: Get.theme.onPrimary, fontSize: 22),
      ),
    ),
  );
}

Widget button(
    {required String text,
    Color? bgColor,
    Function()? onPressed,
    TextStyle? textStyle,
    double radius = 5}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: bgColor ?? Get.context!.theme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    ),
    onPressed: onPressed,
    child: Text(
      text.toUpperCase(),
      textAlign: TextAlign.center,
      style: textStyle ??
          robotoConsid(
              color: Get.context!.theme.onPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold),
    ),
  );
}

Widget loginButton({required String text, Function()? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0, left: 8.0, right: 8.0),
    child: SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                    color: Get.context!.theme.mainColor, width: 2.0)),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(text,
                  textAlign: TextAlign.center,
                  style: robotoConsid(
                      color: Get.context!.theme.mainColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ],
          )),
    ),
  );
}

Widget writeFeedbackButton({required String text, Function()? onPressed}) {
  return SizedBox(
    height: 50,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(color: Color(0xff142A65), width: 2.0)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 10),
            Text(text,
                textAlign: TextAlign.center,
                style: robotoConsid(
                    color: Color(0xff142A65),
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ],
        )),
  );
}

Widget editTextButton(
    {required Function() onTap,
    required String icon,
    required String text,
    String secondIcon = ""}) {
  return boxShadows(
      padding: 0,
      child: customButton(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 30,
            child: Row(
              children: [
                SizedBox(width: 8),
                anySvg(nameSvg: "$icon"),
                SizedBox(
                  width: 10,
                ),
                SizedBox(width: 8),
                Flexible(
                  child: SizedBox(
                    width: Get.width,
                    child: Text(
                      text,
                      maxLines: 1,
                      style: robotoConsid(fontSize: 14),
                    ),
                  ),
                ),
                secondIcon != ""
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: anySvg(nameSvg: "$secondIcon"))
                    : SizedBox(),
                SizedBox(width: 15),
                editSvg(),
              ],
            ),
          ),
        ),
        onTap: onTap,
      ));
}

Widget helpDaria1() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          "daria".tr,
          style: robotoConsid(
              color: Color(0xff142A65), fontWeight: FontWeight.bold),
        ),
      ),
      underLineDashed(
          child: Text(
        "write_a_message".tr,
        style: robotoConsid(color: Color(0xff142A65), height: 2),
      )),
      underLineDashed(
          child: Text(
        "call".tr,
        style: robotoConsid(color: Color(0xff142A65), height: 2),
      )),
    ],
  );
}

Widget helpDaria() {
  return boxShadows(
    child: Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "help_manager".tr,
                    style: robotoConsid(),
                  ),
                  SizedBox(width: 12),
                  Text(
                    "daria".tr,
                    style: robotoConsid(
                        color: Color(0xff142A65), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widgets.customButton(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SvgPicture.asset(
                              "assets/icons/correspond.svg",
                              width: 15,
                            ),
                          ),
                          SizedBox(width: 8),
                          underLineDashed(
                              child: Text(
                            "write_a_message".tr,
                            style: robotoConsid(
                                color: Color(0xff142A65), height: 2),
                          )),
                          SizedBox(width: 20),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                  widgets.customButton(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: SvgPicture.asset(
                              "assets/icons/call.svg",
                              width: 15,
                            ),
                          ),
                          SizedBox(width: 8),
                          underLineDashed(
                              child: Text(
                            "call".tr,
                            style: robotoConsid(
                                color: Color(0xff142A65), height: 2),
                          )),
                        ],
                      ),
                    ),
                    onTap: () {},
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(
            width: 70, child: Image.asset("assets/images/daria.png", width: 60))
      ],
    ),
  );
}

Widget bottomInfoBar() {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
      0.0,
      0.8,
    ], colors: [
      Color(0xff112B66),
      Color(0xff53235A),
    ])),
    child: Column(
      children: [
        arrowButtonProfileBlack(icon: "about_company", text: 'about_company'),
        arrowButtonProfileBlack(icon: "contacts", text: 'contacts'),
        arrowButtonProfileBlack(icon: "partners", text: 'partners'),
        arrowButtonProfileBlack(
            icon: "about_the_application", text: 'about_the_application'),
      ],
    ),
  );
}

Widget radioGender({required int index, required String text}) {
  final controller = Get.put(PersonalDataPageController());
  return GestureDetector(
    onTap: () {
      controller.selectedGender.value = index;
    },
    child: Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Radio<int>(
            value: index,
            activeColor: AppTextStyles.colorBlackMy,
            groupValue: controller.selectedGender.value,
            onChanged: (int? value) {
              controller.selectedGender.value = value!;
            },
          ),
          Text(
            "$text".tr,
            style: robotoConsid(),
          ),
        ],
      ),
    ),
  );
}

Widget switchWithText(
    {bool isActive = false, required Function() onTap, required String label}) {
  return widgets.customButton(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            children: [
              FlutterSwitch(
                inactiveColor: Color(0xffC9CDD6),
                activeColor: Color(0xff2B2861),
                width: 40.0,
                height: 20.0,
                valueFontSize: 25.0,
                toggleSize: 10.0,
                // value: controller.status.value,
                borderRadius: 30.0,
                padding: 5.0,
                showOnOff: false,
                value: isActive,
                onToggle: (bool value) {
                  onTap();
                },
              ),
              SizedBox(width: 20),
              Flexible(
                child: Text(
                  label.tr,
                  style: robotoConsid(),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget selectRadio(
    {required String text,
    required int index,
    bool isTelegram = false,
    bool isWhatsUp = false,
    Function()? onTap}) {
  final controller = Get.put(ProfileParamsPageController());
  return Obx(() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          boxShadows(
            padding: 4,
            child: Row(
              children: [
                Flexible(
                  flex: 10,
                  child: GestureDetector(
                    onTap: () {
                      controller.change(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Radio(
                                  activeColor: Color(0xff112B66),
                                  value: index,
                                  groupValue: controller.selectedRadio.value,
                                  onChanged: (int? value) {
                                    controller.change(index);
                                  },
                                ),
                                SizedBox(width: 15),
                                Flexible(
                                  child: Text(
                                    "$text",
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        robotoConsid(color: Color(0xff2C2D2E)),
                                  ),
                                ),
                                SizedBox(width: 5),
                                if (isTelegram)
                                  Icon(Icons.telegram, color: Colors.blue),
                                SizedBox(width: 5),
                                if (isWhatsUp)
                                  Icon(Icons.whatsapp, color: Colors.green)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: customButton(
                    onTap: onTap!,
                    child: Container(
                      color: Colors.transparent,
                      height: 50,
                      width: 50,
                      child: Center(child: anySvg(nameSvg: "trash")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  });
}

Widget radioTheme({required int index, required String text}) {
  final controller = Get.put(ProfileParamsPageController());
  return customButton(
    onTap: () {
      controller.selectedTheme.value = index;
    },
    child: Container(
      color: Colors.transparent,
      child: Row(
        children: [
          Radio<int>(
            value: index,
            activeColor: AppTextStyles.colorBlackMy,
            groupValue: controller.selectedTheme.value,
            onChanged: (int? value) {
              controller.selectedTheme.value = value!;
            },
          ),
          Text(
            "$text".tr,
            style: robotoConsid(),
          ),
        ],
      ),
    ),
  );
}

Widget boxShadows(
    {required Widget child, double padding = 12, double radius = 5}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Color(0xffD9D9D9).withOpacity(0.6),
          spreadRadius: 0,
          blurRadius: 10,
          offset: Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: child,
    padding: EdgeInsets.all(padding),
  );
}

Widget truckSvg() {
  return SvgPicture.asset(
    "assets/icons/car_ride.svg",
    width: 17,
    height: 19.33,
    color: Color(0xff0C54A1),
  );
}

Widget dollarSvg() {
  return SvgPicture.asset(
    "assets/icons/dollar.svg",
    width: 20,
    height: 22.33,
    color: Color(0xff0C54A1),
  );
}

Widget anySvg(
    {required String nameSvg, Size size = const Size(17, 17), Color? color}) {
  return SvgPicture.asset("assets/icons/$nameSvg.svg",
      color: color, width: size.width, height: size.height);
}

Widget editSvg() {
  return SvgPicture.asset("assets/icons/edit.svg", width: 17, height: 17);
}

Widget userFeedback() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Color(0xffD9D9D9).withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Иван Петров"),
              SizedBox(width: 8),
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
              Spacer(),
              Text("09.04.2021"),
            ],
          ),
          SizedBox(height: 18),
          Text("expample_card5".tr)
        ],
      ),
    ),
  );
}

Widget moreButton({required String text, Function()? onPressed}) {
  return Padding(
    padding:
        const EdgeInsets.only(bottom: 40.0, left: 20.0, right: 8.0, top: 40.0),
    child: SizedBox(
      height: 35,
      width: Get.width / 2,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Color(0xff162A65), width: 1.0)),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 10),
              Text(text,
                  textAlign: TextAlign.center,
                  style: robotoConsid(
                      color: Color(0xff162A65),
                      fontSize: 16,
                      fontWeight: FontWeight.normal)),
            ],
          )),
    ),
  );
}

Widget OrderPayButton(
    {required String text,
    Function()? onPressed,
    bool isActive = true,
    double fontSize = 20}) {
  return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color:
                      isActive ? AppTextStyles.colorBlueMy : Color(0xff9A9A9A),
                  width: 1.0)),
        ),
        onPressed: onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: robotoConsid(
                color: isActive ? AppTextStyles.colorBlueMy : Color(0xff9A9A9A),
                fontSize: fontSize,
                fontWeight: FontWeight.w700)),
      ));
}

Widget buyButton() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Row(
      children: [
        Expanded(
          child: Container(
            height: 50.0,
            decoration: BoxDecoration(
                border: Border.all(color: AppTextStyles.colorRedMy),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5)),
            child: ElevatedButton.icon(
              onPressed: () {
                // controller.isAddedToCard.value = true;
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.transparent, shadowColor: Colors.transparent),
              icon: Icon(
                Icons.shopping_cart,
                color: AppTextStyles.colorRedMy,
              ),
              label: Text(
                'buy'.tr.toUpperCase(),
                style: robotoConsid(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppTextStyles.colorRedMy),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget floatingCard(
    {required BuildContext context,
    required int? price,
    required String? name}) {
  final controller = Get.put(DicountCardPageController());
  return Align(
      alignment: Alignment(0, 1),
      child: Container(
        height: 60,
        color: Colors.white,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: widgets.counterCardRuntime(
              context: context,
              price: price,
              onTap: () {
                controller.counter.value = 1;
                widgets.showOptionCountProduct(
                    context: context, name: '${name}');
              }),
        )),
      ));
}

Widget productWidgetWithCount(
    {bool additionalService = true, required BuildContext context}) {
  final controller = Get.put(WidgetsControllers());
  return Obx(() {
    return boxShadows(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 100,
                width: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset('assets/images/notebook_item.png',
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'expample_card6'.tr,
                      style: robotoConsid(color: Color(0xff62656A)),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '2 000 с',
                          style: robotoConsid(
                              color: Color(0xff494949),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 10),
                        strikeThrough(
                          child: Text(
                            "3 200c",
                            style: robotoConsid(
                              color: AppTextStyles.colorGreyThrou,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Color(0xffF6F6F6),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        "кол-во: 50 шт.= 10000 с.",
                        style: robotoConsid(color: Color(0xff70757A)),
                      ),
                    ),
                    SizedBox(height: 7),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buttonCounter(
                                text: "-",
                                onTap: () {
                                  controller.minus();
                                }),
                            Container(
                              width: 40,
                              child: Center(
                                child: Text(
                                  controller.counter.value.toString(),
                                  style: robotoConsid(
                                      fontWeight: FontWeight.w100,
                                      color: Color(0xff494949),
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
                        SizedBox(
                          width: 4,
                        ),
                        addFavorite(
                            onPressed: () {
                              controller.showMassage(context: context);
                            },
                            context: context),
                        SizedBox(
                          width: 4,
                        ),
                        customButton(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  anySvg(size: Size(20, 20), nameSvg: 'trash'),
                            ),
                            onTap: () {}),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 38,
                        ),
                        Text(
                          'по 10 шт.',
                          style: robotoConsid(
                              color: Color(0xff62656A),
                              fontWeight: FontWeight.w100,
                              fontSize: 10),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 2),
                        anySvg(nameSvg: 'car_blue'),
                        SizedBox(width: 10),
                        Flexible(
                          child: Text("when_coming_delivry".tr,
                              maxLines: 2,
                              style: robotoConsid(
                                  color: AppTextStyles.colorBlueMy,
                                  fontSize: 10)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15),
          additionalService
              ? ListTileTheme(
                  contentPadding: EdgeInsets.all(0),
                  child: Theme(
                    data:
                        ThemeData().copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      onExpansionChanged: (bool expanded) {
                        controller.demoList[1] = !expanded;
                      },
                      collapsedBackgroundColor: Colors.white,
                      backgroundColor: Colors.white,
                      trailing: Text(
                        controller.checkForServices() ? "500 с." : "0 с",
                        style: robotoConsid(fontWeight: FontWeight.bold),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          underLineDashed(
                              child: Text(
                                "additional_services".tr,
                                style: robotoConsid(color: Color(0xff142A65)),
                              ),
                              hight: 3),
                          SizedBox(width: 6),
                          controller.demoList[1]
                              ? Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff142A65),
                                  size: 13,
                                )
                              : anySvg(nameSvg: "arrow_down", size: Size(7, 7)),
                          Spacer(),
                        ],
                      ),
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "assembly_services".tr,
                              style: robotoConsid(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            selectCheckBox(
                                text: 'Теннисный стол Хобби',
                                index: 0,
                                price: '500 с.'),
                            selectCheckBox(
                                text: 'Теннисный стол Хобби',
                                index: 1,
                                price: '200 с.'),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  });
}

Widget orderWithDate() {
  return Row(
    children: [
      Text(
        "Заказ № 31",
        style: robotoConsid(
            color: AppTextStyles.colorBlueMy,
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(width: 10),
      Text(
        "от 28.02.2021  13:15",
        style: robotoConsid(),
      ),
      SizedBox(width: 8),
      GestureDetector(
        onTap: () {
          Get.to(OrderPage());
        },
        child: underLineDashed(
            child: Text(
          "more".tr,
          style: robotoConsid(color: AppTextStyles.colorBlueMy),
        )),
      )
    ],
  );
}

Widget blackBox({required Widget child}) {
  return Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
      0.0,
      0.8,
    ], colors: [
      Color(0xff112B66),
      Color(0xff53235A),
    ])),
    child: child,
  );
}

Widget orderWithDateDark() {
  return Row(
    children: [
      SizedBox(width: 15),
      Text(
        "Заказ № 31964",
        style: robotoConsid(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      SizedBox(width: 10),
      Text(
        "от 28.02.2021  13:15",
        style: robotoConsid(color: Colors.white),
      ),
    ],
  );
}

Widget strikeThrough({required Widget child}) {
  return Container(
    child: child,
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/images/strike.png'), fit: BoxFit.fitWidth),
    ),
  );
}

Widget favoriteWithPrice({required int? price, required BuildContext context}) {
  final controller = Get.put(WidgetsControllers());

  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              "${controller.getPrice(price)} с",
              style: robotoConsid(
                  color: Color(
                    0xff991A4E,
                  ),
                  fontSize: 20,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 10,
            ),
            strikeThrough(
              child: Text(
                controller.getPrice(price) + " с",
                style: robotoConsid(
                    color: AppTextStyles.colorGreyThrou,
                    fontSize: 15,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
        Spacer(),
        addFavoriteBig(
          color: Colors.transparent,
          sizeButton: 60,
          sizeFavorite: 30,
          onPressed: () {
            controller.showMassage(context: context);
          },
        ),
        SizedBox(width: 8),
      ],
    ),
  );
}

Widget dark(
    {required Widget child,
    double height = 50,
    double? width = null,
    double radius = 0}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
          0.0,
          0.8,
        ], colors: [
          Color(0xff112B66),
          Color(0xff53235A),
        ])),
    child: child,
  );
}

Widget productWidget() {
  return boxShadows(
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset('assets/images/notebook_item.png',
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'expample_card6'.tr,
                    style: robotoConsid(color: Color(0xff62656A)),
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '2 000 с',
                        style: robotoConsid(
                            color: Color(0xff494949),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      strikeThrough(
                        child: Text(
                          '3 200 с',
                          style: robotoConsid(
                            color: AppTextStyles.colorGreyThrou,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "кол-во: 50 шт.= 10 000 с.",
                      style: robotoConsid(color: Color(0xff70757A)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

TextStyle robotoConsid(
    {double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppTextStyles.colorBlackMy,
    TextDecoration decoration = TextDecoration.none,
    double height = 0}) {
  return TextStyle(
      fontFamily: "RobotoCondensed-Regular",
      fontSize: fontSize,
      decoration: decoration,
      color: color,
      height: height,
      fontWeight: fontWeight);
}

Widget delivryBox({required BuildContext context}) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffF5F5F5), borderRadius: BorderRadius.circular(5)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14),
        Row(
          children: [
            SizedBox(width: 10),
            truckSvg(),
            SizedBox(width: 15),
            Flexible(
              fit: FlexFit.loose,
              child: Text(
                "delivery_xpected".tr,
                style: robotoConsid(),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),
        SizedBox(height: 19),
        GestureDetector(
          onTap: () {
            showTimeLineSheet(context: context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                underLineDashed(
                  color: AppTextStyles.colorRedMy,
                  child: Text(
                    "arrived_at_pickup_point".tr,
                    style: robotoConsid(
                        color: AppTextStyles.colorRedMy, fontSize: 18),
                  ),
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    "detailing".tr,
                    style: robotoConsid(
                        color: AppTextStyles.colorBlueMy, fontSize: 14),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 9.0),
          child: Text(
            "26 марта 2022 г.",
            style: robotoConsid(fontSize: 12),
          ),
        ),
        SizedBox(height: 4),
        GestureDetector(
            onTap: () {
              showTimeLineSheet(context: context);
              // showSnackBar(context: context);
            },
            child: TimeLinesHorizontal()),
        SizedBox(
          height: 5,
        ),
      ],
    ),
  );
}

void showSnackBar({required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    padding: EdgeInsets.only(bottom: Get.height / 10, right: 10, left: 10),
    duration: Duration(minutes: 2),
    content: contentSnackBar1(context: context),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  ));
}

void getLocationSheet() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    Get.bottomSheet(
      getLocation(),
      backgroundColor: Colors.transparent,
    );
  });
}

Widget chooseLangAndTheme() {
  final controller = Get.put(ProfileParamsPageController());
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          "language".tr,
          style: widgets.robotoConsid(),
        ),
      ),
      SizedBox(height: 15),
      SizedBox(
        height: 60,
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.languageIcons.length,
            itemBuilder: (context, index) {
              return Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widgets.customButton(
                    onTap: () {
                      controller.selectedLang.value =
                          controller.languageIcons[index];

                      controller.changeLang();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: controller.selectedLang.value ==
                                      controller.languageIcons[index]
                                  ? AppTextStyles.colorBlueMy
                                  : Colors.white)),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: controller.languageIcons[index] == "en"
                            ? widgets.imagePng(name: "lang/en.png")
                            : widgets.anySvg(
                                nameSvg:
                                    "lang/${controller.languageIcons[index]}",
                                size: Size(40, 40)),
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
      SizedBox(height: 20),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Text(
          "app_theme".tr,
          style: widgets.robotoConsid(),
        ),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widgets.radioTheme(index: 0, text: "light"),
          widgets.radioTheme(index: 1, text: "dark"),
        ],
      ),
    ],
  );
}

Widget getLocation() {
  final controller = Get.put(IntroController());
  return boxShadows(
    padding: 0,
    radius: 10,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: Get.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "permission_position".tr,
                      textAlign: TextAlign.center,
                      style: widgets.robotoConsid(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Чтобы знать в какой\nгород доставлять товар",
                      textAlign: TextAlign.center,
                      style: widgets.robotoConsid(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                widgets.customButton(
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "not".tr,
                        style: widgets.robotoConsid(),
                      ),
                    ),
                  ),
                  onTap: () {
                    controller.onDonePress();
                  },
                ),
                widgets.customButton(
                  child: Container(
                    height: 100,
                    child: Center(
                      child: Text(
                        "yes".tr,
                        style: widgets.robotoConsid(),
                      ),
                    ),
                  ),
                  onTap: () {
                    controller.streamPosition();
                    controller.onDonePress();
                    Get.back();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

void scaleImageSheet({required BuildContext context, required String image}) {
  showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      enableDrag: false,
      context: context,
      builder: (context) {
        return scaleImage(context: context, image: image);
      });
}

Widget scaleImage({required BuildContext context, required String image}) {
  TransformationController controller = TransformationController();
  TapDownDetails? tapDownDetails;

  final currentIndex = 0.obs;
  return Obx(() {
    return boxShadows(
      padding: 0,
      radius: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height,
        child: Stack(children: [
          Swiper(
            itemBuilder: (context, index) {
              return GestureDetector(
                onDoubleTapDown: (details) => tapDownDetails = details,
                onDoubleTap: () {
                  double correctScaleValue =
                      controller.value.getMaxScaleOnAxis();
                  final position = tapDownDetails!.localPosition;
                  double scale = 2;
                  if (correctScaleValue == 2) {
                    scale = 4;
                  }

                  final x = -position.dx * (scale - 1);
                  final y = -position.dy * (scale - 1);
                  final zoomed = Matrix4.identity()
                    ..translate(x, y)
                    ..scale(scale);

                  // controller.value.isIdentity()
                  final value =
                      correctScaleValue < 4 ? zoomed : Matrix4.identity();
                  controller.value = value;
                },
                child: Container(
                  child: InteractiveViewer(
                      transformationController: controller,
                      maxScale: 4,
                      minScale: 1,
                      child: CachedNetworkImage(
                          imageUrl: image, fit: BoxFit.contain)),
                ),
              );
            },
            itemCount: 3,
            controller: SwiperController(),
            onIndexChanged: (index) {
              currentIndex.value = index;
              controller.value = Matrix4.identity();
            },
            autoplay: false,
          ),
          Align(
              alignment: Alignment(0.9, -0.9),
              child: customButtonOval(
                  child: anySvg(nameSvg: 'close', size: Size(17, 17)),
                  onTap: () {
                    print("нажал");
                    Get.back();
                  })),
          Align(
              alignment: Alignment(0, 1),
              child: widgets.indicatorDots(
                  currentIndex: currentIndex.value, length: 3)),
        ]),
      ),
    );
  });
}

void showConfirmCodePhone(
    {required BuildContext context, required String number}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return confinrmCodeSheet(context: context, number: number);
      });
}

Widget alertButton({required String text, required Function() onTap}) {
  return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTextStyles.colorBlueMy,
      ),
      child: Text(
        "$text".tr,
        style: robotoConsid(color: Colors.white),
      ));
}

Widget confinrmCodeSheet(
    {required BuildContext context, required String number}) {
  final controller = Get.put(AddPhonePageController());
  return Obx(() {
    return boxShadows(
      padding: 8,
      radius: 10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        height: Get.height / 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                    color: Color(0xffE4E4E4),
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "we_have_sent_code".tr,
                      style: robotoConsid(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      number,
                      style: robotoConsid(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "enter_it_below".tr,
                      style: robotoConsid(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PinFieldAutoFill(
                        autoFocus: true,
                        codeLength: 4,
                        decoration: UnderlineDecoration(
                            colorBuilder:
                                FixedColorBuilder(AppTextStyles.colorBlueMy),
                            textStyle: robotoConsid(
                                fontSize: 25,
                                color: AppTextStyles.colorBlueMy)),
                        onCodeChanged: (value) {
                          controller.receivedCode.value = value!;
                          if (value == "5555") {
                            if (Prefs.isLogin) {
                              controller.savePhone();
                            }
                            controller.phoneController.text = "";
                            Get.back();
                          }
                        },
                        onCodeSubmitted: (val) {
                          print("onCodeSubmitted $val");
                        },
                        currentCode: controller.receivedCode.value),
                    SizedBox(height: 20),
                    controller.checkFullCode()
                        ? Text(
                            "incorrect_code".tr,
                            style:
                                robotoConsid(color: AppTextStyles.colorRedMy),
                          )
                        : SizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  });
}

void showTimeLineSheet({required BuildContext context}) {
  showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return contentSnackBar1(context: context);
      });
}

Widget contentSnackBar1({required BuildContext context}) {
  return boxShadows(
    padding: 8,
    radius: 10,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      height: Get.height / 2.5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                  color: Color(0xffE4E4E4),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 40.0, top: 10, right: 10),
                        child: Text(
                          "order_status_detail".tr,
                          style: robotoConsid(fontSize: 16),
                        ),
                      ),
                      Spacer(),
                      customButtonOval(
                        onTap: () {
                          Get.back();
                        },
                        child: anySvg(nameSvg: 'close', size: Size(17, 17)),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(width: 10),
                      SizedBox(
                          height: Get.height / 3.8,
                          width: 17,
                          child: TimeLinesVertical()),
                      SizedBox(width: 20),
                      SizedBox(
                        height: Get.height / 3.8,
                        width: Get.width / 1.4,
                        child: Column(
                          children: [
                            dateAndStatus(
                                status: "placed_order".tr,
                                date: "26 марта 2022г."),
                            dateAndStatus(
                                status: "awaiting_payment".tr,
                                date: "27 марта 2022г."),
                            dateAndStatus(
                                status: "on_my_way".tr,
                                date: "28 марта 2022г."),
                            dateAndStatus(
                                status: "ready_for_shipment".tr,
                                date: "29 марта 2022г."),
                            dateAndStatus(
                                status: "completed".tr,
                                date: "30 марта 2022г."),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

// Widget contentSnackBar({required BuildContext context}) {
//   return boxShadows(
//     child: Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       height: Get.height / 2.5,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 10),
//                 child: Text(
//                   "order_status_detail".tr,
//                   style: robotoConsid(fontSize: 16),
//                 ),
//               ),
//               Spacer(),
//               GestureDetector(
//                 onTap: () {
//                   ScaffoldMessenger.of(context).hideCurrentSnackBar();
//                 },
//                 child: Container(
//                   width: 50,
//                   height: 50,
//                   child: Center(
//                     child: Container(
//                         height: 25,
//                         width: 25,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(
//                               color: Color(0xff868584),
//                               width: 2,
//                             )),
//                         child: Icon(
//                           Icons.close_sharp,
//                           size: 15,
//                           color: Color(0xff868584),
//                         )),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 30),
//           Row(
//             children: [
//               SizedBox(width: 5),
//               SizedBox(
//                   height: Get.height / 3.8,
//                   width: 17,
//                   child: TimeLinesVertical()),
//               SizedBox(width: 5),
//               SizedBox(
//                 height: Get.height / 3.8,
//                 width: Get.width / 1.4,
//                 child: Column(
//                   children: [
//                     dateAndStatus(
//                         status: "placed_order".tr, date: "26 марта 2022г."),
//                     dateAndStatus(
//                         status: "awaiting_payment".tr, date: "27 марта 2022г."),
//                     dateAndStatus(
//                         status: "on_my_way".tr, date: "28 марта 2022г."),
//                     dateAndStatus(
//                         status: "ready_for_shipment".tr,
//                         date: "29 марта 2022г."),
//                     dateAndStatus(
//                         status: "completed".tr, date: "30 марта 2022г."),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget dateAndStatus({required String status, required String date}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 25.0),
    child: Row(
      children: [
        Text(
          "$status",
          style: robotoConsid(fontSize: 14),
        ),
        Spacer(),
        Text(
          "$date",
          style: robotoConsid(fontSize: 14, color: Colors.grey),
          overflow: TextOverflow.fade,
        ),
        SizedBox(width: 10),
      ],
    ),
  );
}

Widget getThemeOzon({required Widget child}) {
  return Theme(
    child: child,
    data: ThemeData().copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTextStyles.colorBlueMy,
        ),
        dividerColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            labelStyle: TextStyle(color: AppTextStyles.colorGrayMy))),
  );
}

Widget getTheme({required Widget child}) {
  return Theme(
    child: child,
    data: ThemeData().copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTextStyles.colorBlueMy,
        ),
        dividerColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppTextStyles.colorBlueMy, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextStyles.colorRedMy),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(width: 1, color: Colors.transparent),
            ),
            labelStyle: TextStyle(color: AppTextStyles.colorGrayMy))),
  );
}

Widget getThemeBorderGreyTextFild({required Widget child}) {
  return Theme(
    child: child,
    data: ThemeData().copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppTextStyles.colorBlueMy,
        ),
        dividerColor: Colors.transparent,
        inputDecorationTheme: InputDecorationTheme(
            isDense: true,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: AppTextStyles.colorBlueMy, width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextStyles.colorRedMy),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide:
                  BorderSide(width: 1, color: AppTextStyles.colorGrayMy),
            ),
            labelStyle: TextStyle(color: AppTextStyles.colorGrayMy))),
  );
}

Widget getDropDownPhone() {
  final controller = Get.put(AuthPageController());
  return Obx(() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: controller.dropList
              .map<DropdownMenuItem<String>>(
                  (CountryCode item) => DropdownMenuItem<String>(
                        value: item.number,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: item.number == "+996" ? 2.0 : 4.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: anySvg(nameSvg: item.iconSVg)),
                            ),
                            SizedBox(width: 5),
                            Text(item.number),
                          ],
                        ),
                      ))
              .toList(),
          value: controller.selectedCountryPhone.value,
          onChanged: (String? value) {
            print("код страны телефона");
            print(value);
            controller.selectedCountryPhone.value = value!;
          },
        ),
      ),
    );
  });
}

Widget themeChangeAdress({required Widget child}) {
  return Theme(
    child: child,
    data: ThemeData().copyWith(
        splashColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff112B66),
        ),
        dividerColor: AppTextStyles.colorBlueMy,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffC4C4C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff112B66), width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextStyles.colorRedMy),
              borderRadius: BorderRadius.circular(5),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: BorderSide(width: 1, color: Colors.transparent),
            // ),
            labelStyle: TextStyle(color: Color(0xff696A6A)))),
  );
}

Widget themeSelectDelivery({required Widget child}) {
  return Theme(
    child: child,
    data: ThemeData().copyWith(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Color(0xff112B66),
        ),
        dividerColor: Colors.blueAccent,
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(80.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Color(0xffC4C4C4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xff112B66), width: 1.0),
              borderRadius: BorderRadius.circular(5.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTextStyles.colorRedMy),
              borderRadius: BorderRadius.circular(5),
            ),
            // enabledBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(5),
            //   borderSide: BorderSide(width: 1, color: Colors.transparent),
            // ),
            labelStyle: TextStyle(color: Color(0xff696A6A)))),
  );
}

Widget loginButtonNew({required String text, Function()? onPressed}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff112B66), Color(0xff991A4E)]),
        borderRadius: BorderRadius.circular(5)),
    child: ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent, shadowColor: Colors.transparent),
      icon: AppIcon(AppIcons.person,
          size: 20, color: Get.context!.theme.onPrimary),
      label: Text(
        text,
        style: robotoConsid(
            fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),
      ),
    ),
  );
}

Widget saveButton({required String text, Function()? onPressed}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
        color: AppTextStyles.colorRedMy,
        borderRadius: BorderRadius.circular(5)),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent, shadowColor: Colors.transparent),
      child: Text(
        "save".tr,
        style: robotoConsid(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
      ),
    ),
  );
}

Widget orderButton(
    {required String text, double fontSize = 18, Function()? onPressed}) {
  return Container(
    width: double.infinity,
    height: 50.0,
    decoration: BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xff112B66), Color(0xff991A4E)]),
        borderRadius: BorderRadius.circular(5)),
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: Colors.transparent, shadowColor: Colors.transparent),
      child: Text(
        text,
        style: robotoConsid(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: Colors.white),
      ),
    ),
  );
}

Widget addCartButton({required String text, Function()? onPressed}) {
  return gradientCustomButton(
      onTap: onPressed,
      child: Center(
        child: AutoSizeText(text.toUpperCase(),
            maxFontSize: 14,
            minFontSize: 5,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: robotoConsid(
              color: Colors.white,
              fontSize: 14,
            )),
      ));
}

Widget addCardAndFavoriteAndCar(
    {required String textCard,
    required BuildContext context,
    Function()? onPressedCard,
    Function()? onPressedFavorite,
    bool isSelectedFavorite = false,
    bool isAddedToCard = false}) {
  return Column(
    children: [
      Padding(
          padding: EdgeInsets.only(left: 9),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/car_ride.svg",
                width: 14,
                height: 17.33,
                color: AppTextStyles.colorBlueMy,
              ),
              SizedBox(width: 7.37),
              Expanded(
                child: Text(
                  "Под заказ, доставим в Бишкек 24 - 31 октября",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: widgets.robotoConsid(
                    color: AppTextStyles.colorBlueMy,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(width: 7.37),
            ],
          )),
      SizedBox(height: 10),
      Row(
        children: [
          SizedBox(width: 9.00),
          isAddedToCard
              ? counterCardOneProductTest()
              : Expanded(
                  child: gradientCustomButton(
                      onTap: onPressedCard,
                      child: Center(
                        child: AutoSizeText(textCard.toUpperCase(),
                            maxFontSize: 14,
                            minFontSize: 5,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: robotoConsid(
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      )),
                ),
          SizedBox(width: 5.00),
          widgets.addFavorite(
              onPressed: onPressedFavorite,
              isSelected: isSelectedFavorite,
              context: context),
          SizedBox(width: 9.00),
        ],
      ),
    ],
  );
}

Widget addCardAndFavorite(
    {required String textCard,
    required BuildContext context,
    Function()? onPressedCard,
    Function()? onPressedFavorite,
    bool isSelectedFavorite = false,
    bool isAddedToCard = false,
    double rightPadding = 9.0}) {
  return Row(
    children: [
      SizedBox(width: 9.00),
      isAddedToCard
          ? counterCardOneProductTest()
          : Expanded(
              child: gradientCustomButton(
                  onTap: onPressedCard,
                  child: Center(
                    child: AutoSizeText(textCard.toUpperCase(),
                        maxFontSize: 14,
                        minFontSize: 5,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        style: robotoConsid(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  )),
            ),
      SizedBox(width: 5.00),
      widgets.addFavorite(
          onPressed: onPressedFavorite,
          isSelected: isSelectedFavorite,
          context: context),
      SizedBox(width: rightPadding),
    ],
  );
}

Widget addFavoriteBig(
    {required Function()? onPressed,
    double? sizeFavorite,
    double? sizeButton,
    IconData? icon = Icons.favorite,
    bool isSelected = false,
    Color color = const Color(0xffE5E5E5)}) {
  return colorCustomButton(
    height: 50,
    width: 50,
    color: AppTextStyles.colorGrayDividar,
    child: Center(
      child: Icon(
        icon,
        size: sizeFavorite ?? 20,
        color: isSelected ? AppTextStyles.colorRedMy : Color(0xff7B7B7B),
      ),
    ),
    onTap: onPressed,
  );
}

Widget addFavorite(
    {required Function()? onPressed,
    required BuildContext context,
    double? sizeFavorite,
    double? sizeButton,
    IconData? icon = Icons.favorite,
    bool isSelected = false,
    Color color = const Color(0xffE5E5E5)}) {
  final controller = Get.put(WidgetsControllers());
  return colorCustomButton(
    color: AppTextStyles.colorGrayDividar,
    child: Center(
      child: Icon(
        icon,
        size: sizeFavorite ?? 20,
        color: isSelected ? AppTextStyles.colorRedMy : Color(0xff7B7B7B),
      ),
    ),
    onTap: () {
      controller.showMassage(context: context);
    },
  );
}

Widget shareButton(
    {Function()? onPressed, double? sizeFavorite, double? sizeButton}) {
  return SizedBox(
    width: sizeButton ?? 35,
    height: sizeButton ?? 35,
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xffE5E5E5), borderRadius: BorderRadius.circular(5)),
      child: IconButton(
          color: Color(0xffE5E5E5),
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffE5E5E5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: onPressed,
          icon: Icon(
            Icons.share,
            size: sizeFavorite ?? 20,
          )),
    ),
  );
}

Widget fullWidthButton(
    {required String text,
    AppIcons icon = AppIcons.person,
    Color? bgColor,
    double radius = 5,
    double iconSize = 25,
    TextStyle? textStyle,
    Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? Get.context!.theme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Get.context!.theme.primary)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(icon, size: iconSize, color: Get.context!.theme.onPrimary),
            SizedBox(width: 10),
            Text(text,
                textAlign: TextAlign.center,
                style: textStyle ??
                    robotoConsid(
                        color: Get.context!.theme.onPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
          ],
        )),
  );
}

Widget titleDescrpPrice({
  String? title,
  String? price,
  String? oldPrice,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 9.0, bottom: 5),
        child: AutoSizeText(
          title ?? "",
          textAlign: TextAlign.left,
          maxFontSize: 14,
          minFontSize: 14,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: widgets.robotoConsid(
            fontSize: 14,
          ),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: AutoSizeText(
              "${price ?? ""} с",
              maxLines: 1,
              maxFontSize: 16,
              textAlign: TextAlign.center,
              style: widgets.robotoConsid(
                  fontSize: 16,
                  color: AppTextStyles.colorRedMy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          strikeThrough(
            child: Text(
              "${oldPrice ?? ""} с",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: widgets.robotoConsid(
                fontSize: 14,
                color: AppTextStyles.colorGreyThrou,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        height: 5,
      ),
      Padding(
          padding: EdgeInsets.only(left: 9),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/car_ride.svg",
                width: 14,
                height: 17.33,
                color: AppTextStyles.colorBlueMy,
              ),
              SizedBox(width: 7.37),
              Expanded(
                child: Text(
                  "Под заказ, доставим в Бишкек 24 - 31 октября",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: widgets.robotoConsid(
                    color: AppTextStyles.colorBlueMy,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ),
              SizedBox(width: 7.37),
            ],
          )),
      SizedBox(
        height: 8,
      ),
    ],
  );
}

Widget titleDescrpPriceWithoutCar({
  String? title,
  String? price,
  String? oldPrice,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 9.0, bottom: 5),
        child: AutoSizeText(
          title ?? "",
          textAlign: TextAlign.left,
          maxFontSize: 14,
          minFontSize: 14,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: widgets.robotoConsid(
            fontSize: 14,
          ),
        ),
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9.0),
            child: Text(
              "${price ?? ""} с",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: widgets.robotoConsid(
                  fontSize: 16,
                  color: AppTextStyles.colorRedMy,
                  fontWeight: FontWeight.w900),
            ),
          ),
          SizedBox(width: 10),
          widgets.strikeThrough(
            child: Text(
              "${oldPrice ?? ""} с",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: widgets.robotoConsid(
                fontSize: 14,
                color: AppTextStyles.colorGreyThrou,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget bottomPopularCards({int? index, required BuildContext context}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 9.0, bottom: 5),
        child: AutoSizeText(
          "Менделейка / Набор для опытов 6шт /Детский наборdsfffffffffffffffff",
          maxFontSize: 12,
          minFontSize: 12,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: widgets.robotoConsid(),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(left: 9),
          child: Row(
            children: [
              SvgPicture.asset(
                "assets/icons/car_ride.svg",
                width: 13,
                height: 17.33,
                color: AppTextStyles.colorBlueMy,
              ),
              SizedBox(width: 7.37),
              Expanded(
                child: Text("Под заказ, доставим в Бишкек 24 - 31 октября",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: widgets.robotoConsid(
                        fontSize: 12, color: AppTextStyles.colorBlueMy)),
              ),
              SizedBox(width: 7.37),
            ],
          )),
      SizedBox(
        height: 8,
      ),
      widgets.addCardAndFavorite(
          isAddedToCard: index == 0 ? true : false,
          textCard: 'to_cart'.tr,
          onPressedCard: () {},
          onPressedFavorite: () {},
          isSelectedFavorite: index == 0 ? true : false,
          context: context),
      SizedBox(
        height: 8,
      )
    ],
  );
}

Widget fullWidthButton1(
    {required String text,
    AppIcons icon = AppIcons.person,
    Color? bgColor,
    double radius = 5,
    double iconSize = 25,
    TextStyle? textStyle,
    Function()? onPressed}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? Get.context!.theme.primary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
              side: BorderSide(color: Get.context!.theme.primary)),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(icon, size: iconSize, color: Get.context!.theme.onPrimary),
            SizedBox(width: 10),
            Text(text,
                textAlign: TextAlign.center,
                style: textStyle ??
                    robotoConsid(
                        color: Get.context!.theme.onPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.bold)),
          ],
        )),
  );
}

Widget rowText({required String text1, required String text2}) {
  return Row(
    children: [
      Text(
        text1,
        style: robotoConsid(color: Color(0xff62656A)),
      ),
      Flexible(
        child: Container(
          height: 9,
          width: Get.width,
          decoration: DottedDecoration(
              color: AppTextStyles.colorBlackMy,
              shape: Shape.line,
              dash: [2, 2]),
        ),
      ),
      Text(
        text2,
        style: robotoConsid(color: Color(0xff62656A)),
      ),
    ],
  );
}

Widget arrowButton(
    {required String icon, required String label, required int index}) {
  final c = Get.put(DicountCardPageController());

  return Theme(
    data: ThemeData().copyWith(dividerColor: Colors.transparent),
    child: boxShadows(
      child: ExpansionTile(
          collapsedBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          leading: SvgPicture.asset(
            "assets/icons/$icon.svg",
            width: 17,
            height: 19.33,
            color: AppTextStyles.colorBlueMy,
          ),
          title: Text(
            "$label".tr,
            style: robotoConsid(fontSize: 14),
          ),
          children: <Widget>[
            Text(
              "refund_goods".tr,
              style: robotoConsid(color: Color(0xff777777)),
            ),
          ],
          onExpansionChanged: (bool expanded) {
            c.demoList[index] = !expanded;
          }),
    ),
  );
}

Widget blockPlaceholder({bool enabled = true}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[50]!,
    enabled: true,
    child: Container(color: Colors.white),
  );
}

Widget productPlaceholder(
    {bool enabled = true, double? width, double height = 200}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[50]!,
    enabled: enabled,
    child: Container(
      margin: EdgeInsets.all(0),
      padding: EdgeInsets.all(0),
      height: height,
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 50,
            child: Container(width: double.infinity, color: Colors.white),
          ),
          SizedBox(height: 5),
          Expanded(
            flex: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  color: Colors.white,
                  child: Text('placeholder', style: robotoConsid(fontSize: 14)),
                ),
                SizedBox(height: 4),
                rating(2.5),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                            color: Colors.white,
                            child: Text(
                              '1234.00',
                            )),
                      ],
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget catalogPlaceholder(
    {bool enabled = true, double height = 150, double width = 120}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[50]!,
    enabled: enabled,
    child: Container(
      height: height,
      width: width,
      //color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.all(0),
              child: Container(color: Colors.white),
            ),
          ),
          SizedBox(height: 5),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  child: Text(
                    'placeholder',
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget checkBoxWithText(
    {bool value = false,
    required String text,
    TextStyle? textStyle,
    Function()? onTap}) {
  return widgets.customButton(
    onTap: onTap!,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        color: Colors.transparent,
        child: Row(children: [
          SizedBox(
            width: 20,
            child: Checkbox(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              value: value,
              activeColor: Get.context!.theme.primary,
              onChanged: (bool? value) {
                onTap();
              },
            ),
          ),
          const SizedBox(width: 15),
          Text(text, style: textStyle ?? robotoConsid()),
        ]),
      ),
    ),
  );
}

Widget customCheckBox(
    {bool value = false,
    required String text,
    TextStyle? textStyle,
    Function(bool? val)? onChanged}) {
  return Row(children: [
    Checkbox(
        value: value,
        onChanged: onChanged,
        activeColor: Get.context!.theme.primary),
    const SizedBox(width: 5),
    Text(text, style: textStyle ?? robotoConsid(fontWeight: FontWeight.w500))
  ]);
}

Widget checkBoxWithIcon(
    {bool value = false, required Icon icon, Function()? onChanged}) {
  return customButton(
    onTap: onChanged!,
    child: Container(
      color: Colors.transparent,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          width: 30,
          child: Checkbox(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            value: value,
            activeColor: Get.context!.theme.primary,
            onChanged: (bool? value) {
              onChanged();
            },
          ),
        ),
        if (icon != null) icon,
      ]),
    ),
  );
}

Widget addAdressButton({required String text, Function()? onPressed}) {
  return customButton(
    onTap: onPressed!,
    child: SizedBox(
      height: 50,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xff142A65),
                  width: 2.0,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text("+",
                    style: TextStyle(color: Color(0xff142A65), fontSize: 20)),
                SizedBox(width: 5),
                Text(text,
                    textAlign: TextAlign.center,
                    style: robotoConsid(
                        color: Color(0xff142A65),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    ),
  );
}

// Widget customMenuList({required List<MenuItem> list}) {
//   return Container(
//     padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//     decoration: BoxDecoration(
//       color: Get.context!.theme.focus,
//       borderRadius: BorderRadius.circular(4.0),
//     ),
//     child: Column(
//       children: list
//           .map((item) => InkWell(
//                 onTap: item.onPressed ??
//                     () {
//                       if (item.page != null) Get.toNamed(item.page!);
//                     },
//                 child: Container(
//                   margin: const EdgeInsets.symmetric(vertical: 5),
//                   padding: const EdgeInsets.symmetric(
//                       vertical: 18.0, horizontal: 16.0),
//                   decoration: BoxDecoration(
//                     color: Get.context!.theme.surface,
//                     borderRadius: BorderRadius.circular(8.0),
//                   ),
//                   child: Row(
//                     children: [
//                       if (item.leading != null)
//                         Row(children: [
//                           item.leading!,
//                           const SizedBox(width: 16),
//                         ]),
//                       Text(
//                         item.title!,
//                         style: GoogleFonts.mPlusRounded1c(
//                             fontSize: Helper.responsive(18.0, xs: 14.0),
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ],
//                   ),
//                 ),
//               ))
//           .toList(),
//     ),
//   );
// }

Widget currencyAndCityWidget() {
  return Row(
    children: [
      Expanded(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      'your_city'.tr,
                      style: robotoConsid(),
                    ),
                  ),
                  Text(
                    'bishkek'.tr,
                    style: robotoConsid(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              AppIcon(AppIcons.city,
                  size: 18, color: AppTextStyles.colorBlackMy),
              SizedBox(width: 8),
            ],
          ),
        ),
      ),
      SizedBox(width: 19),
      Expanded(
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          decoration: BoxDecoration(
            color: Color(0xffF6F6F6),
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Row(
            children: [
              AppIcon(AppIcons.currency,
                  size: 18, color: AppTextStyles.colorBlackMy),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'currency'.tr,
                    style: robotoConsid(),
                  ),
                  Text(
                    'kyrgyz_som'.tr,
                    style:
                        robotoConsid(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget helpDariaNew() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: boxShadows(
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "support".tr,
                      style: robotoConsid(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    widgets.customButton(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: SvgPicture.asset(
                                  "assets/icons/correspond.svg",
                                  width: 15,
                                ),
                              ),
                              SizedBox(width: 8),
                              underLineDashed(
                                  child: Text(
                                "write_a_message".tr,
                                style: robotoConsid(
                                    color: AppTextStyles.colorBlueMy,
                                    height: 2),
                              )),
                              SizedBox(width: 20),
                            ],
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                    widgets.customButton(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SvgPicture.asset(
                                "assets/icons/call.svg",
                                width: 15,
                              ),
                            ),
                            SizedBox(width: 8),
                            underLineDashed(
                                child: Text(
                              "call".tr,
                              style: robotoConsid(
                                  color: AppTextStyles.colorBlueMy, height: 2),
                            )),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
              width: 70,
              child: Image.asset("assets/images/daria.png", width: 60))
        ],
      ),
    ),
  );
}

Widget arrowButtonProfile(
    {required String icon,
    required String text,
    bool notification = false,
    bool isActive = true,
    String? page,
    bool haveDivider = true}) {
  final controller = Get.put(OrderHistPageController());
  return widgets.customButton(
    onTap: () {
      if (page == AppRouter.favorite) {
        controller.tabSelect(2);
        return;
      }

      if (page != null) {
        Get.toNamed(page);
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26.0),
      child: Container(
        height: 50,
        decoration: haveDivider
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xffF6F6F6),
                    width: 1.0,
                  ),
                ),
              )
            : BoxDecoration(),
        child: Row(
          children: [
            icon != ""
                ? SvgPicture.asset("assets/icons/$icon.svg",
                    semanticsLabel: 'Acme Logo')
                : SizedBox(
                    width: 20,
                  ),
            SizedBox(width: 20),
            Text(
              "$text".tr,
              style: robotoConsid(fontSize: 14),
            ),
            SizedBox(width: 10),
            notification
                ? Container(
                    width: 20,
                    height: 22,
                    decoration: BoxDecoration(
                        color: isActive ? Color(0xff991A4E) : Color(0xff62656A),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "1",
                      style: robotoConsid(color: Colors.white, fontSize: 14),
                    )),
                  )
                : SizedBox(),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff424242),
              size: 12,
            ),
          ],
        ),
      ),
    ),
  );
}

Widget arrowButtonProfileBlack(
    {required String icon,
    required String text,
    bool notification = false,
    bool isActive = true}) {
  return customButton(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 50,
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/$icon.svg",
                semanticsLabel: 'Acme Logo'),
            SizedBox(width: 20),
            Text(
              "$text".tr,
              style: robotoConsid(fontSize: 14, color: Colors.white),
            ),
            SizedBox(width: 10),
            notification
                ? Container(
                    width: 20,
                    height: 22,
                    decoration: BoxDecoration(
                        color: isActive ? Color(0xff991A4E) : Color(0xff62656A),
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                        child: Text(
                      "1",
                      style: robotoConsid(color: Colors.white, fontSize: 14),
                    )),
                  )
                : SizedBox(),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 12,
            ),
          ],
        ),
      ),
    ),
    onTap: () {},
  );
}

Widget customTextField(String text, {bool required = false}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 7),
        child: TextField(
          decoration: InputDecoration(
            fillColor: Get.context!.theme.surface,
            filled: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
            ),
          ),
        ),
      ),
      Positioned(
        top: 0,
        left: 20,
        child: RichText(
          text: TextSpan(
            text: text,
            style: robotoConsid(
              fontSize: 12,
              color: Get.context!.theme.mainTextColor.withOpacity(0.6),
            ),
            children: [
              if (required)
                TextSpan(
                  text: ' *',
                  style: robotoConsid(
                    fontSize: 12,
                    color: AppTextStyles.colorRedMy,
                  ),
                ),
            ],
          ),
        ),
      ),
    ],
  );
}

Widget supportCenterButton() => fullWidthButton(
    text: 'support'.tr,
    icon: AppIcons.chat,
    onPressed: () {
      Get.toNamed(AppRouter.supportService);
    });

Widget wigetForNewUser({Function(String? val)? onTap}) {
  final controller = Get.put(ChangeAdressController());
  final controllerCart = Get.put(ShoppingCartPageController());
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        GetBuilder<ShoppingCartPageController>(builder: (context) {
          return Form(
            key: controller.loginFormKey,
            child: Column(
              children: [
                SizedBox(
                    height: 55,
                    child: DropdownButtonFormField<String>(
                        hint: Text(
                          "your_city".tr,
                          style: robotoConsid(),
                        ),
                        icon: SizedBox(),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffC4C4C4), width: 1.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xffC4C4C4),
                              )),
                          focusColor: Color(0xffC4C4C4),
                        ),
                        value: controllerCart.selectedCity.value,
                        items: controllerCart.citys!
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: robotoConsid(),
                                )))
                            .toList(),
                        onChanged: onTap)),
                SizedBox(height: 20),
                Get.arguments == null
                    ? Column(
                        children: [
                          TextFormField(
                            onSaved: (value) {
                              controller.streetName = value!;
                            },
                            validator: (value) {
                              return controller.validateStritName(value!);
                            },
                            controller: controller.streetController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'street'.tr,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  onSaved: (value) {
                                    controller.houseName = value!;
                                  },
                                  validator: (value) {
                                    return controller.validateHouseName(value!);
                                  },
                                  controller: controller.houseController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'home_address'.tr,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                flex: 1,
                                child: TextFormField(
                                  onSaved: (value) {
                                    controller.apartament = value!;
                                  },
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    labelText: 'apartment'.tr,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    : SizedBox(),
              ],
            ),
          );
        }),
      ],
    ),
  );
}

Widget pageChangeAdgress() {
  late YandexMapController controllerY;
  final Point _point = Point(latitude: 42.88, longitude: 74.60);
  final animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
  final controller = Get.put(ChangeAdressController());
  final controllerShippingMethods = Get.put(ShippingMethodsController());
  final controllerPaymentMethod = Get.put(BeforPaymentDevliryController());
  final controllerCart = Get.put(ShoppingCartPageController());
  return Obx(() {
    return Stack(
      children: [
        YandexMap(
          mapObjects: controller.mapObjects.value,
          onMapCreated: (YandexMapController yandexMapController) async {
            controllerY = yandexMapController;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              wigetForNewUser(onTap: (item) async {
                print(item);
                controllerCart.selectedCity.value = item!;
                await controllerY.moveCamera(
                    CameraUpdate.newCameraPosition(
                        CameraPosition(target: _point)),
                    animation: animation);
              }),
              Spacer(),
              saveButton(
                  text: "save",
                  onPressed: () {
                    if (controller.checkAdress()) {
                      if (controllerShippingMethods.selectedPage.value == 0) {
                        controllerPaymentMethod
                            .isSelectedDelivryFreeMethod.value = true;
                      }
                      if (controllerShippingMethods.selectedPage.value == 1) {
                        controllerPaymentMethod
                            .isSelectedDelivryPayMethod.value = true;
                      }
                    }
                  }),
              SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  });
}
