import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/orders_hist/order_hist_page_controller.dart';
import '../../styles.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/order_widgets/order_list_widget.dart';
import '../../widgets/widgets.dart' as widgets;

class OrdersHistPage extends StatelessWidget {
  final c = Get.put(OrderHistPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.theme.background,
        leading: BackButton(color: Colors.black),
        title: Text(
          'order_history'.tr,
          style: AppTextStyles.roboto(
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => OrderListWidget(list: c.orderList),
              ),
              const SizedBox(height: 40),
              widgets
                  .fullWidthButton(
                    icon: AppIcons.chat,
                    text: 'support'.tr,
                    onPressed: () {})
                  .paddingSymmetric(horizontal: 12),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
