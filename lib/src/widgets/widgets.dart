import 'dart:developer';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart' hide MenuItem;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../helpers/app_router.dart';
import '../models/country_code.dart';
import '../models/menu_item.dart';
import '../helpers/helper.dart';
import '../helpers/prefs.dart';

import '../models/news_list.dart';
import '../pages/auth/auth_page/auth_page_controller.dart';
import '../pages/current_orders/order_page/order_page.dart';
import '../pages/discounts/discount_card_page_controller.dart';
import '../pages/news/all_news_controller.dart';

import '../pages/shopping_cart/before_payment_delivry/before_payment_delivry_controller.dart';
import '../pages/shopping_cart/before_payment_delivry/shipping_methods/change_address/change_address_controller.dart';
import '../pages/shopping_cart/before_payment_delivry/shipping_methods/shipping_methods_controller.dart';
import '../pages/shopping_cart/shopping_cart_page_controller.dart';
import 'orders_widgets/time_line_horizontal.dart';
import '../pages/products_by_catalog/products_by_catalog_page.dart';
import '../styles.dart';
import 'app_icon.dart';
import 'cart_widgets/cart_icon.dart';
import 'orders_widgets/time_line_vertical.dart';
import '../models/news.dart';

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

Widget titleWidget(
  String title, {
  Widget? trailing,
  String suffix = ':',
  Function()? onTrailingTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 0),
    child: ListTile(
      title: Text(
        title + suffix,
        style: robotoConsid(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 0),
    ),
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
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
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
      ),
      Divider(height: 1, color: AppTextStyles.colorGrayDividar),
    ],
  );
}

BottomNavigationBar bottomNavigation(
    {int currentTab = 0, Function(int sel)? onSelectTab}) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Get.context!.theme.primary,
    iconSize: 22,
    backgroundColor: Get.context!.theme.background,
    selectedIconTheme: IconThemeData(size: 28),
    unselectedItemColor: Get.context!.theme.secondary.withOpacity(1),
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
      // BottomNavigationBarItem(
      //   icon: Icon(Icons.wb_incandescent),
      //   label: 'interesting'.tr,
      // ),
      /*BottomNavigationBarItem(
          title: new Container(height: 5.0),
          icon: Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Get.theme.accentColor,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
              boxShadow: [
                BoxShadow(color: Get.theme.accentColor.withOpacity(0.4), blurRadius: 40, offset: Offset(0, 15)),
                BoxShadow(color: Get.theme.accentColor.withOpacity(0.4), blurRadius: 13, offset: Offset(0, 3))
              ],
            ),
            child: new Icon(Icons.home, color: Get.theme.primaryColor),
          )),*/
      BottomNavigationBarItem(
        icon: CartIcon(), // new Icon(Icons.shopping_cart),
        label: 'shopping_cart'.tr,
      ),
      BottomNavigationBarItem(
        icon: new Icon(Icons.person),
        label: 'profile'.tr,
      ),
    ],
  );
}

Widget location({required String adress, Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 8.0),
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
                      ListTile(
                        onTap: () {
                          print(controller.citys![i]);
                          controller.selectedCity.value = controller.citys![i];
                          Get.back();
                        },
                        title: Text(
                          controller.citys![i],
                          style: robotoConsid(),
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
                              value: controller.selectedCity?.value,
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
                                controller.selectedCity?.value = item!;
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

Widget anySvg({required String nameSvg, Size size = const Size(17, 17),  Color? color}) {
  return SvgPicture.asset("assets/icons/$nameSvg.svg",
      color: color,
      width: size.width, height: size.height);
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
    {required String text, Function()? onPressed, bool isActive = true}) {
  return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: BorderSide(
                  color: isActive ? Color(0xff0C54A1) : Color(0xff9A9A9A),
                  width: 1.0)),
        ),
        onPressed: onPressed,
        child: Text(text,
            textAlign: TextAlign.center,
            style: robotoConsid(
                color: isActive ? Color(0xff0C54A1) : Color(0xff9A9A9A),
                fontSize: 20,
                fontWeight: FontWeight.w700)),
      ));
}

Widget orderWithDate() {
  return Row(
    children: [
      Text(
        "Заказ № 31",
        style: robotoConsid(
            color: Color(0xff112B66),
            fontSize: 17,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(width: 10),
      Text(
        "от 28.02.2021  13:15",
        style: robotoConsid(),
      ),
      SizedBox(width: 10),
      GestureDetector(
        onTap: () {
          Get.to(OrderPage());
        },
        child: underLineDashed(
            child: Text(
          "more".tr,
          style: robotoConsid(color: Color(0xff0C54A1)),
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

Widget dark({required Widget child}) {
  return Container(
    height: 50,
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
                        '2000 с',
                        style: robotoConsid(
                            color: Color(0xff494949),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Text(
                        '3 200 сом',
                        style: robotoConsid(
                          color: Color(0xff62656A),
                          decoration: TextDecoration.lineThrough,
                          fontSize: 16,
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
    Color color = Colors.black,
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
            // showSnackBar(context: context);
            showTimeLineSheet(context: context);
          },
          child: Row(
            children: [
              SizedBox(
                width: 9,
              ),
              underLineDashed(
                color: Color(0xff991A4E),
                child: Text(
                  "arrived_at_pickup_point".tr,
                  style: robotoConsid(color: Color(0xff991A4E), fontSize: 18),
                ),
              ),
              Spacer(),
              underLineDashed(
                child: Text(
                  "detailing".tr,
                  style: robotoConsid(color: Color(0xff0C54A1), fontSize: 14),
                ),
              ),
              SizedBox(width: 10),
            ],
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
                      GestureDetector(
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
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 35),
        maximumSize: Size(double.infinity, 35),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
            side: BorderSide(color: Color(0xff162A65), width: 1.0)),
      ),
      onPressed: onPressed,
      child: AutoSizeText(text.toUpperCase(),
          maxFontSize: 14,
          minFontSize: 5,
          textAlign: TextAlign.center,
          maxLines: 1,
          style: robotoConsid(
              color: Color(0xff112B66),
              fontSize: 14,
              fontWeight: FontWeight.normal)));
}

Widget addFavorite(
    {Function()? onPressed,
    double? sizeFavorite,
    double? sizeButton,
    IconData? icon = Icons.favorite}) {
  return SizedBox(
    width: sizeButton ?? 35,
    height: sizeButton ?? 35,
    child: Container(
      decoration: BoxDecoration(
          color: Color(0xffF6F6F6), borderRadius: BorderRadius.circular(5)),
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
            icon,
            size: sizeFavorite ?? 20,
            color: Color(0xff7B7B7B),
          )),
    ),
  );
}

Widget IconBattonSvg(
    {Function()? onPressed, double? sizeFavorite, double? sizeButton}) {
  return SizedBox(
    width: sizeButton ?? 40,
    height: sizeButton ?? 40,
    child: Container(
        decoration: BoxDecoration(
            color: Color(0xffF6F6F6), borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/trash.svg',
          ),
        )),
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
      Spacer(),
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
                  Text(
                    'your_city'.tr,
                    style: robotoConsid(),
                  ),
                  Text(
                    'bishkek'.tr,
                    style: robotoConsid(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Spacer(),
              AppIcon(AppIcons.city, size: 18, color: Colors.black),
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
              AppIcon(AppIcons.currency, size: 18, color: Colors.black),
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
                    style: robotoConsid(color: Color(0xff142A65), height: 2),
                  )),
                  SizedBox(width: 20),
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
                    style: robotoConsid(color: Color(0xff142A65), height: 2),
                  )),
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

Widget arrowButtonProfile(
    {required String icon,
    required String text,
    bool notification = false,
    bool isActive = true,
    String? page}) {
  return GestureDetector(
    onTap: page != null
        ? () {
            Get.toNamed(page!);
          }
        : null,
    child: Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffF6F6F6),
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        children: [
          SvgPicture.asset("assets/icons/$icon.svg",
              semanticsLabel: 'Acme Logo'),
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
  );
}

Widget arrowButtonProfileBlack(
    {required String icon,
    required String text,
    bool notification = false,
    bool isActive = true}) {
  return Container(
    height: 50,
    child: Row(
      children: [
        SvgPicture.asset("assets/icons/$icon.svg", semanticsLabel: 'Acme Logo'),
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
