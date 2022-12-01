import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../styles.dart';
import 'current_order_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class CurrentOrdersPage extends StatelessWidget {
  final c = Get.put(CurrentOrderPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'current_orders'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widgets.boxShadows(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widgets.orderWithDate(),
                  SizedBox(height: 15),
                  widgets.delivryBox(context: context),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios_new,
                        size: 13,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Container(
                                  padding: EdgeInsets.all(8),
                                  child: widgets.boxShadows(
                                      child: Image.asset(
                                          'assets/images/sofa.png')),
                                );
                              }),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 13,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/dollar.svg'),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ИТОГО: 1500",
                            style: widgets.robotoConsid(fontSize: 16),
                          ),
                          Text(
                            "скидка:",
                            style: widgets.robotoConsid(fontSize: 16),
                          ),
                          Text(
                            "Оплачено: 1000 с",
                            style: widgets.robotoConsid(
                                color: Color(0xff62656A), fontSize: 16),
                          ),
                          Text("Остаток: 500 с",
                              style: widgets.robotoConsid(
                                  color: Color(0xff62656A), fontSize: 16)),
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "payment_method".tr,
                        style: widgets.robotoConsid(
                            color: Color(0xff112B66), fontSize: 16),
                      ),
                      Text(
                        "visa_elcart".tr,
                        style: widgets.robotoConsid(
                            color: Color(0xff62656A), fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                          child: widgets.OrderPayButton(
                              text: 'pay_order'.tr, onPressed: () {})),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                          child: widgets.OrderPayButton(
                              isActive: false,
                              text: 'cancel_order'.tr,
                              onPressed: () {}))
                    ],
                  ),
                  SizedBox(height: 3),
                ],
              )),
            ),

            // Obx(() => OrderListWidget(list: c.orderList.value, currentOrders: true)),
          ],
        ),
      ),
    );
  }
}
