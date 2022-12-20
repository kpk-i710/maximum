import 'package:flutter/material.dart' hide MenuItem;
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/current_orders/order_page/order_page_controller.dart';

import '../../../helpers/prefs.dart';
import '../../../styles.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/widgets.dart' as widgets;

class OrderPage extends StatelessWidget {
    OrderPage({Key? key}) : super(key: key);

  final controller = Get.put(OrderPageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.theme.background,
        leading: BackButton(color: Colors.black),
        title: Text(
          'completed_orders'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
                0.0,
                0.8,
              ], colors: [
                Color(0xff112B66),
                Color(0xff53235A),
              ])),
              child: widgets.orderWithDateDark(),
            ),
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: widgets.delivryBox(context: context)),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  widgets.productWidget(),
                  SizedBox(height: 10),
                  widgets.productWidget(),
                  SizedBox(height: 10),
                  widgets.productWidget(),
                  SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "payment_method".tr,
                    style: widgets.robotoConsid(
                        color: Color(0xff112B66), fontSize: 16),
                  ),
                  Text("visa_elcart".tr,
                      style: widgets.robotoConsid(
                          color: Color(0xff424242), fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "delivery_methods".tr,
                    style: widgets.robotoConsid(
                        color: Color(0xff112B66), fontSize: 16),
                  ),
                  Text("free_to_bishkek".tr,
                      style: widgets.robotoConsid(
                          color: Color(0xff424242), fontSize: 16)),
                ],
              ),
            ),
            SizedBox(height: 17),
            widgets.blackBox(
                child: Column(
              children: [
                SizedBox(height: 23),
                textForBotton(name: "Товаров: ", price: "3"),
                textForBotton(name: "Цена без скидки: ", price: "59500"),
                textForBotton(name: "Скидка", price: "1200"),
                textForBotton(name: "Доставка", price: "159"),
                textForBotton(name: "Оплачено", price: "50 000"),
                textForBotton(name: "Остаток к оплате", price: "6800"),
                SizedBox(height: 17),
                Row(
                  children: [
                    SizedBox(width: 23),
                    Expanded(
                      child: Text(
                        "Итого",
                        style: widgets.robotoConsid(
                            color: Colors.white, fontSize: 24),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "56 850с",
                        style: widgets.robotoConsid(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 23),
              ],
            )),
          ],
        ),
      ),
    );
  }

  Widget textForBotton({required String name, required String price}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Row(
        children: [
          SizedBox(width: 23),
          Expanded(
            child: Text(
              "$name",
              style: widgets.robotoConsid(color: Colors.white, fontSize: 16),
            ),
          ),
          Expanded(
            child: Text(
              "$price",
              style: widgets.robotoConsid(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget orderAtrWidget(String atr, String val, {Color? color}) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            atr,
            style: widgets.robotoConsid(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color ?? Get.context!.theme.mainTextColor.withOpacity(0.8),
            ),
          ),
        ),
        Expanded(
          child: Text(
            val,
            style: widgets.robotoConsid(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: color ?? Get.context!.theme.mainTextColor.withOpacity(0.8),
            ),
          ),
        ),
      ],
    );
  }
}
