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
                SizedBox(height: 20),
                widgets.switchWithText(
                    isActive: controller.discounts.value,
                    onTap: () {
                      controller.discounts.value = !controller.discounts.value;
                    },
                    label: 'notifications_about_discounts'),
                widgets.switchWithText(
                    isActive: controller.delivery.value,
                    onTap: () {
                      controller.delivery.value = !controller.delivery.value;
                    },
                    label: 'delivery_notices'),
                widgets.switchWithText(
                    isActive: controller.pe.value,
                    onTap: () {
                      controller.pe.value = !controller.pe.value;
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
                            onTap: () {
                              controller.automobileMy.value =
                                  !controller.automobileMy.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'motorbike'.tr,
                            value: controller.motorbike.value,
                            onTap: () {
                              controller.motorbike.value =
                                  !controller.motorbike.value;
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
                            onTap: () {
                              controller.scooter.value =
                                  !controller.scooter.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'bike'.tr,
                            value: controller.bike.value,
                            onTap: () {
                              controller.bike.value = !controller.bike.value;
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
                            onTap: () {
                              controller.sport.value = !controller.sport.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'cars'.tr,
                            value: controller.automobile.value,
                            onTap: () {
                              controller.automobile.value =
                                  !controller.automobile.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'garden'.tr,
                            value: controller.garden.value,
                            onTap: () {
                              controller.garden.value =
                                  !controller.garden.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'health'.tr,
                            value: controller.health.value,
                            onTap: () {
                              controller.health.value =
                                  !controller.health.value;
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
                            onTap: () {
                              controller.tourism.value =
                                  !controller.tourism.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'hunting'.tr,
                            value: controller.hunting.value,
                            onTap: () {
                              controller.hunting.value =
                                  !controller.hunting.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'construction'.tr,
                            value: controller.building.value,
                            onTap: () {
                              controller.building.value =
                                  !controller.building.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'electronics'.tr,
                            value: controller.electronics.value,
                            onTap: () {
                              controller.electronics.value =
                                  !controller.electronics.value;
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
                            onTap: () {
                              controller.dog.value = !controller.dog.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'fishs'.tr,
                            value: controller.fish.value,
                            onTap: () {
                              controller.fish.value = !controller.fish.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'reptile'.tr,
                            value: controller.reptile.value,
                            onTap: () {
                              controller.reptile.value =
                                  !controller.reptile.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'horse'.tr,
                            value: controller.horse.value,
                            onTap: () {
                              controller.horse.value = !controller.horse.value;
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
                            onTap: () {
                              controller.cat.value = !controller.cat.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'bird'.tr,
                            value: controller.bird.value,
                            onTap: () {
                              controller.bird.value = !controller.bird.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'rodent'.tr,
                            value: controller.rodent.value,
                            onTap: () {
                              controller.rodent.value =
                                  !controller.rodent.value;
                            }),
                        widgets.checkBoxWithText(
                            text: 'sheep'.tr,
                            value: controller.rams.value,
                            onTap: () {
                              controller.rams.value = !controller.rams.value;
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
