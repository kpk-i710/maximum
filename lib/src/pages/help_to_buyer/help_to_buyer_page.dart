import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'help_to_buyer_page_controller.dart';

class HelpToBuyerPage extends StatelessWidget {
  final c = Get.put(HelpToBuyerPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        leading: Icon(Icons.arrow_back_ios, color: Colors.black),
        title: Text('help_for_buyer'.tr,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('check_out'.tr,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Text('order_min_summ'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('what_are_ways_to_receive_an_order'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('cant_choose_pickup'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('delivery_date_has_changed_in_the_cart'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('promo_code_does_not_apply'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('how_to_find_out_the_order_status'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text('modification_and_cancellation_of_order'.tr,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Text('how_to_change_an_order'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('how_to_cancel_the_order'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text('canceled_order_but_its_still_active'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
            ListTile(
              leading: Text(
                'when_will_money_return_if_order_cancelled'.tr,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
