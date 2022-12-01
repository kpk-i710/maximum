import 'package:flutter/material.dart' hide MenuItem;
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/app_router.dart';
import '../../models/menu_item.dart';
import '../../styles.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/widgets.dart' as widgets;

class SupportServicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('contacts'.tr,
                      style: AppTextStyles.roboto(fontSize: 24)),
                  AppIcon(AppIcons.cancel),
                ],
              ),
              const SizedBox(height: 10),
              contactCardWidget('+ 996 553 93 11 11'),
              contactCardWidget('+ 996 553 93 11 11'),
              contactCardWidget('+ 996 553 93 11 11'),
              contactCardWidget('+ 996 553 93 11 11'),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('write_message'.tr,
                      style: AppTextStyles.roboto(fontSize: 24)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  messengerWidget(
                    'assets/images/whatsapp.png',
                    onClick: () {
                      Get.toNamed(AppRouter.whatsappContacts);
                    },
                  ),
                  messengerWidget(
                    'assets/images/telegram.png',
                    onClick: () async {
                      await launch('https://t.me');
                    },
                  ),
                  messengerWidget(
                    'assets/images/instagram.png',
                    onClick: () async {
                      await launch('https://instagram.com');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              widgets.fullWidthButton(
                  text: 'call_me'.tr,
                  icon: AppIcons.phone_circle,
                  onPressed: () {}),
              const SizedBox(height: 30),
              // widgets.customMenuList(list: [
              //   MenuItem(
              //       leading: const AppIcon(AppIcons.bus, size: 20),
              //       title: 'reference_information'.tr),
              //   MenuItem(
              //       leading: const AppIcon(AppIcons.qa, size: 20),
              //       title: 'faq'.tr,
              //       page: AppRouter.faq),
              // ]),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget messengerWidget(String asset, {Function()? onClick}) => Card(
        child: InkWell(
          onTap: onClick,
          child: Container(
            height: 70,
            width: 100,
            child: Image.asset(asset),
          ),
        ),
      );

  Widget contactCardWidget(String contact) => Card(
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Center(
            child: Text(
              contact,
              style: AppTextStyles.robotoCondensed(
                fontSize: 24,
                color: Get.context!.theme.primary,
              ),
            ),
          ),
        ),
      );
}
