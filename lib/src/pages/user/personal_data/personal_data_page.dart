import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/app_icon.dart';
import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;

class PersonalDataPage extends StatelessWidget {
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
                    Text('personal_data'.tr,
                      style: AppTextStyles.robotoCondensed(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                widgets.customTextField('last_name'.tr, required: true),
                const SizedBox(height: 20),
                widgets.customTextField('name'.tr, required: true),
                const SizedBox(height: 20),
                widgets.customTextField('middle_name'.tr),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: context.theme.surface,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20,
                      horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('choose_language'.tr,
                        style: AppTextStyles.robotoCondensed(
                          fontSize: 18,
                          color: context.theme.mainTextColor.withOpacity(0.6),
                        ),
                      ).paddingOnly(left: 10),
                      Row(
                        children: [
                          Image.asset('assets/images/flag_ru.png'),
                          const SizedBox(width: 8),
                          Image.asset('assets/images/flag_kg.png'),
                          const SizedBox(width: 8),
                          Image.asset('assets/images/flag_us.png'),
                          const SizedBox(width: 8),
                          Image.asset('assets/images/flag_uz.png'),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                widgets.currencyAndCityWidget(),
                const SizedBox(height: 30),
                widgets.bigFullWidthButton(text: 'save'.tr, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }

}