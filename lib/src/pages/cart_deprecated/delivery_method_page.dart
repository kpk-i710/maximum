import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/app_icon.dart';
import 'package:maxkgapp/src/widgets/widgets.dart' as widgets;

class DeliveryMethodPage extends StatelessWidget {
  final tab = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        backgroundColor: context.theme.background,
        elevation: 2,
        leading: BackButton(color: context.theme.mainTextColor),
        title: Text('Выберите способ доставки',
          style: AppTextStyles.roboto(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                children: [
                  Expanded(
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Obx(() => AnimatedSwitcher(
                        duration: Duration(milliseconds: 500),
                        child: tab.value == 0 ? Container(
                          height: double.infinity,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.symmetric(
                                vertical: 25, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                radioWithText('ПВЗ 4 мкрн. дом 6'),
                                const SizedBox(height: 20),
                                radioWithText('ПВЗ Восток 6, дом 8'),
                                const SizedBox(height: 20),
                                radioWithText('ПВЗ Матыева 148'),
                                const SizedBox(height: 20),
                                radioWithText('ПВЗ Медерова 8/1'),
                                const SizedBox(height: 20),
                              ],
                            ),
                          ),
                        ) : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      radioWithText('ПВЗ 4 мкрн. дом 6'),
                                      const SizedBox(height: 20),
                                      radioWithText('ПВЗ 4 мкрн. дом 6'),
                                      const SizedBox(height: 20),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 35,
                                          vertical: 0,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: context.theme.primary),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Icon(Icons.add,
                                              size: 55,
                                              color: context.theme.greyWeak,
                                            ),
                                            const SizedBox(width: 15),
                                            Text('add_address'.tr,
                                              style: AppTextStyles
                                                  .robotoCondensed(
                                                fontSize: 20,
                                                color: context.theme.primary,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text('Укажите  удобное для вас время доставки:',
                                style: AppTextStyles.robotoCondensed(
                                  fontSize: 14,
                                  color: context.theme.mainTextColor
                                      .withOpacity(0.6),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: context.theme.primary,
                                    width: 2,
                                  ),
                                ),
                                child: Text('с  9.00 до 12.00',
                                  style: AppTextStyles.robotoCondensed(
                                    fontSize: 24,
                                    color: context.theme.mainTextColor
                                        .withOpacity(0.6)
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 30),
                                child: Text('с 12.00 до 15.00',
                                  style: AppTextStyles.robotoCondensed(
                                      fontSize: 24,
                                      color: context.theme.mainTextColor
                                          .withOpacity(0.6)
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 30),
                                child: Text('с 15.00 до 19.00',
                                  style: AppTextStyles.robotoCondensed(
                                      fontSize: 24,
                                      color: context.theme.mainTextColor
                                          .withOpacity(0.6)
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() => Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            side: tab.value == 0
                                ? BorderSide(color: context.theme.primary)
                                : BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              tab.value = 0;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppIcon(AppIcons.store,
                                      color: context.theme.primary),
                                  const SizedBox(width: 10),
                                  Text('Пункт выдачи',
                                    style: AppTextStyles.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Obx(() => Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            side: tab.value == 1
                                ? BorderSide(color: context.theme.primary)
                                : BorderSide.none,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: InkWell(
                            onTap: () {
                              tab.value = 1;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  AppIcon(AppIcons.car_ride,
                                      color: context.theme.primary),
                                  const SizedBox(width: 10),
                                  Text('Курьер',
                                    style: AppTextStyles.roboto(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
              child: Column(
                children: [
                  Text('Доставим ориентировочно 13-15 марта',
                    style: AppTextStyles.robotoCondensed(
                      fontSize: 16,
                      color: context.theme.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 28),
                  widgets.bigFullWidthButton(text: 'save'.tr, onPressed: () {}),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget radioWithText(String text, {
    bool value = false,
    bool? groupValue,
    Function(dynamic value)? onChanged}) => Row(
    children: [
      Radio(value: value, groupValue: groupValue,
          onChanged: onChanged ?? (value) {}),
      const SizedBox(width: 10),
      Text(text,
        style: AppTextStyles.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );

}