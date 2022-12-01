import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/app_icon.dart';
import 'package:maxkgapp/src/widgets/widgets.dart' as widgets;

class PaymentMethodPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        backgroundColor: context.theme.background,
        elevation: 2,
        leading: BackButton(color: context.theme.mainTextColor),
        title: Text('Выберите способ оплаты',
          style: AppTextStyles.roboto(fontSize: 18),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Column(
                children: [
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          radioWithText('Наличными в офисе'),
                          const SizedBox(height: 20),
                          radioWithText('Наличными курьеру'),
                          const SizedBox(height: 20),
                          radioWithText('Безналичными на расчетный счет'),
                          const SizedBox(height: 20),
                          radioWithText('Онлайн оплата VISA'),
                          const SizedBox(height: 20),
                          radioWithText('Кошелек Эльсом'),
                          const SizedBox(height: 20),
                          radioWithText('Согласовать с менеджером'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text('1. Оплата безналичными принимается по 100% предоплате.\n' +
                      '2. Для оплаты выберите наиболее удобный для вас банк .\n'+
                      '3. После оформления заказа, вам необходимо распечатать или скачать счет на оплату.',
                    style: AppTextStyles.mPlusRounded1c(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: context.theme.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
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
                  Text('Для подтверждения платежа отправьте \nквитанция на вотсап',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.robotoCondensed(
                      fontSize: 16,
                      color: context.theme.mainTextColor.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 18),
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
    Function(dynamic val)? onChanged}) => Row(
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