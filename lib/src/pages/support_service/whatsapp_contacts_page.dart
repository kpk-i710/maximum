import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../styles.dart';
import '../../widgets/app_icon.dart';

class WhatsappContactsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Написать в Whatsapp',
                      style: AppTextStyles.roboto(fontSize: 24)),
                  AppIcon(AppIcons.cancel),
                ],
              ),
              const SizedBox(height: 30),
              Text('Звонки и видео связь не доступны,\n' +
              'вы можете отправить текстовое или\n голосовое сообщение',
                textAlign: TextAlign.center,
                style: AppTextStyles.mPlusRounded1c(
                  fontSize: 14, fontWeight: FontWeight.w500,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              contactCardWidget('Эльвира'),
              contactCardWidget('Айдана', isMyManager: true),
              contactCardWidget('Дарья'),
              contactCardWidget('Лилия'),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget contactCardWidget(String contact, {bool isMyManager = false}) => Card(
    elevation: 5,
    margin: const EdgeInsets.only(bottom: 20),
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: isMyManager ? 5 : 15, bottom: 15,
          left: 15, right: 15),
      child: Column(
        children: [
          if (isMyManager)
            Text('Ваш персональный менеджер',
              style: AppTextStyles.robotoCondensed(
                fontSize: 12,
                color: Get.context!.theme.mainTextColor.withOpacity(0.6),
              ),
            ),
          Text(contact,
            style: AppTextStyles.robotoCondensed(
              fontSize: 24,
              color: Get.context!.theme.primary,
            ),
          ),
        ],
      ),
    ),
  );

}