import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../styles.dart';
import 'notifications_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class NotificationsDelivryPage extends StatelessWidget {
  final controller = Get.put(NotificationsPageController());

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        indicatorColor: AppTextStyles.colorBlackMy,
        toggleableActiveColor: AppTextStyles.colorBlackMy,
      ),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            backgroundColor: context.theme.background,
            appBar: AppBar(
              backgroundColor: context.theme.background,
              leading: BackButton(color: Colors.black),
              elevation: 0,
              title: Text('notifications'.tr,
                  style: widgets.robotoConsid(fontSize: 17)),
            ),
            body: Column(
              children: [
                TabBar(labelColor: AppTextStyles.colorBlackMy, tabs: [
                  Tab(text: "Новые"),
                  Tab(text: "Прочитанные"),
                ]),
                SizedBox(height: 20),
                Expanded(
                  child: Obx(() {
                    return TabBarView(children: [
                      newNoty(context: context),
                      readNotyCompleted(context: context)
                    ]);
                  }),
                ),
              ],
            )),
      ),
    );
  }

  Widget newNoty({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: List.generate(controller.newNoti.length, (index) => widgets.notificationAll(
            context: context,
            time: controller.newNoti[index].data,
            description: controller.newNoti[index].description,
            onTap: () {
              controller.nakeOldNoti(index: index);
            }))
      ),
    );
  }

  Widget readNotyCompleted({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: List.generate(controller.oldNoti.length, (index) => widgets.notificationAll(
            context: context,
            time: controller.oldNoti[index].data,
            description: controller.oldNoti[index].description,
            onTap: () {
              controller.nakeOldNoti(index: index);
            }) )
      ),
    );
  }
}
