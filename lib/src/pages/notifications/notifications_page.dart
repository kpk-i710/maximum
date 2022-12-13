import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/notification_widgets/notification_list_widget.dart';
import '../../styles.dart';
import 'notifications_page_controller.dart';

class NotificationsDelivryPage extends StatelessWidget {
  final c = Get.put(NotificationsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
        appBar: AppBar(
          backgroundColor: context.theme.background,
          leading: BackButton(color: Colors.black),
          title: Text('notifications'.tr, style: TextStyle(color: Colors.black)),
        ),
        body: RefreshIndicator(
          onRefresh: c.onRefresh,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
            child: Column(
              children: [
                Obx(() => NotificationListWidget(list: c.notfList.value)),
              ],
            ),
          ),
        ));
  }
}
