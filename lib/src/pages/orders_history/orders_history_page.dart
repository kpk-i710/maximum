import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/orders_history/order_history_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;
import 'package:maxkgapp/src/styles.dart';

class OrdersHistPage extends StatelessWidget {
  final controller = Get.put(OrderHistPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: AppTextStyles.colorBlackMy),
        title: Text(
          'order_history'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              orderCard(context: context),
              SizedBox(height: 20),
              orderCard(context: context),
              SizedBox(height: 20),
              orderCard(context: context),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderCard({required BuildContext context}){
    return widgets.boxShadows(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgets.orderWithDate(),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                widgets.showTimeLineSheet(context: context);
              },
              child: widgets.underLineDashed(
                color: AppTextStyles.colorRedMy,
                child: Text(
                  "close".tr,
                  style: widgets.robotoConsid(
                      color: AppTextStyles.colorRedMy, fontSize: 17),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "26 марта 2022 г.",
              style: widgets.robotoConsid(
                  color: AppTextStyles.colorGrayMy, fontSize: 12),
            ),
            SizedBox(height: 20),
            Center(
              child: widgets.raitingEmodjy(onTap: (double rating) {
                print(rating);
              }),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
              child: widgets.OrderPayButton(
                  text: 'leave_feedback'.tr,
                  fontSize: 15,
                  onPressed: () {
                    widgets.leaveFeedback(context: context);
                  }),
            ),
            SizedBox(height: 20),
          ],
        ));
  }

}
