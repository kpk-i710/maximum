import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;

class AddPhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background1,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text('add_your_phone_numbers'.tr,
                      style: AppTextStyles.robotoCondensed(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                phoneWidget('0550882588', def: true),
                phoneWidget('0770889980'),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Get.context!.theme.surface,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: Icon(Icons.add, color: context.theme.grey, size: 40),
                  ),
                ),
                const SizedBox(height: 30),
                widgets.bigFullWidthButton(text: 'save'.tr, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget phoneWidget(String phone, {bool hasWhatsApp = false, bool def = false}) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: def ? 5 : 20, bottom: 20,
              left: 15, right: 15),
          decoration: BoxDecoration(
            color: Get.context!.theme.surface,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (def)
                Text('your_default_number'.tr,
                  style: AppTextStyles.robotoCondensed(
                    fontSize: 13,
                    color: Get.context!.theme.mainTextColor.withOpacity(0.6),
                  ),
                ).paddingOnly(bottom: 5),
              Text(phone,
                  style: AppTextStyles.robotoCondensed(
                    fontSize: 20,
                    color: Get.context!.theme.mainTextColor.withOpacity(0.6),
                  ),
              ),
            ],
          ),
        ),
        widgets.customCheckBox(value: true, text: 'whatsapp_number'.tr),
      ],
    );
  }

}