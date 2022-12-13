import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import '../../../widgets/widgets.dart' as widgets;
import 'notifications_page_controller.dart';

class NotifacationsPage extends StatelessWidget {
  NotifacationsPage({Key? key}) : super(key: key);

  final controller = Get.put(NotificationsPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  "notification_settings".tr,
                  style: widgets.robotoConsid(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 40),
                widgets.switchWithText(
                    isActive: controller.discounts.value,
                    onTap: (bool val) {
                      controller.discounts.value = val;
                    },
                    label: 'notifications_about_discounts'),
                SizedBox(height: 30),
                widgets.switchWithText(
                    isActive: controller.delivery.value,
                    onTap: (bool val) {
                      controller.delivery.value = val;
                    },
                    label: 'delivery_notices'),
                SizedBox(height: 30),
                widgets.switchWithText(
                    isActive: controller.pe.value,
                    onTap: (bool val) {
                      controller.pe.value = val;
                    },
                    label: 'Пе'),
                SizedBox(height: 30),
                Text(
                  "get_the_best_deals".tr,
                  style: widgets.robotoConsid(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "i_have".tr,
                  style: widgets.robotoConsid(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'automobile'.tr,
                            value: controller.automobileMy.value,
                            onChanged: (val) {
                              controller.automobileMy.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'motorbike'.tr,
                            value: controller.motorbike.value,
                            onChanged: (val) {
                              controller.motorbike.value = val!;
                            }),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'scooter1'.tr,
                            value: controller.scooter.value,
                            onChanged: (val) {
                              controller.scooter.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'bike'.tr,
                            value: controller.bike.value,
                            onChanged: (val) {
                              controller.bike.value = val!;
                            }),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 20),
                Text(
                  "my_hobbies".tr,
                  style: widgets.robotoConsid(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'sport'.tr,
                            value: controller.sport.value,
                            onChanged: (val) {
                              controller.sport.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'cars'.tr,
                            value: controller.automobile.value,
                            onChanged: (val) {
                              controller.automobile.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'garden'.tr,
                            value: controller.garden.value,
                            onChanged: (val) {
                              controller.garden.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'health'.tr,
                            value: controller.health.value,
                            onChanged: (val) {
                              controller.health.value = val!;
                            }),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'tourism'.tr,
                            value: controller.tourism.value,
                            onChanged: (val) {
                              controller.tourism.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'hunting'.tr,
                            value: controller.hunting.value,
                            onChanged: (val) {
                              controller.hunting.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'construction'.tr,
                            value: controller.building.value,
                            onChanged: (val) {
                              controller.building.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'electronics'.tr,
                            value: controller.electronics.value,
                            onChanged: (val) {
                              controller.electronics.value = val!;
                            }),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Divider(),
                SizedBox(height: 20),
                Text(
                  "my_pets_animals".tr,
                  style: widgets.robotoConsid(
                      fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'dog'.tr,
                            value: controller.dog.value,
                            onChanged: (val) {
                              controller.dog.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'fishs'.tr,
                            value: controller.fish.value,
                            onChanged: (val) {
                              controller.fish.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'reptile'.tr,
                            value: controller.reptile.value,
                            onChanged: (val) {
                              controller.reptile.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'horse'.tr,
                            value: controller.horse.value,
                            onChanged: (val) {
                              controller.horse.value = val!;
                            }),
                      ],
                    ),
                    SizedBox(width: 30),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        widgets.checkBoxWithText(
                            text: 'cat'.tr,
                            value: controller.cat.value,
                            onChanged: (val) {
                              controller.cat.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'bird'.tr,
                            value: controller.bird.value,
                            onChanged: (val) {
                              controller.bird.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'rodent'.tr,
                            value: controller.rodent.value,
                            onChanged: (val) {
                              controller.rodent.value = val!;
                            }),
                        widgets.checkBoxWithText(
                            text: 'sheep'.tr,
                            value: controller.rams.value,
                            onChanged: (val) {
                              controller.rams.value = val!;
                            }),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                widgets.saveButton(
                    text: "save",
                    onPressed: () {
                      Get.back();
                    }),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ));
      }),
    );
  }
}
