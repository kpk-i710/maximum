import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/shopping_cart/before_payment_delivry/shipping_methods/shipping_methods_page.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../styles.dart';
import '../../../widgets/app_icon.dart';
import '../../../helpers/app_router.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../../../pages/user/profile_params/profile_params_page_controller.dart';
import '../../shopping_cart/shopping_cart_page_controller.dart';

class ProfileParamsPage extends StatelessWidget {
  final controller = Get.put(ProfileParamsPageController());
  final controllerShoppingCart = Get.put(ShoppingCartPageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(AppRouter.main, arguments: 3);
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: widgets.bottomNavigation(
            currentTab: 0, onSelectTab: controller.tabSelect),
        body: Obx(() {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widgets.dark(
                      height: 60,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          const AppIcon(AppIcons.profile_circle_outlined,
                              size: 18, color: Colors.white),
                          SizedBox(width: 15),
                          Text(
                            "my_settings".tr,
                            style: widgets.robotoConsid(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      )),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: LinearPercentIndicator(
                      center: Text(
                        "80%",
                        style: widgets.robotoConsid(color: Colors.white),
                      ),
                      animation: true,
                      lineHeight: 20.0,
                      backgroundColor: AppTextStyles.colorGrayDividar,
                      animationDuration: 1000,
                      percent: 0.8,
                      barRadius: Radius.circular(5),
                      progressColor: AppTextStyles.colorBlueMy,
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Text(
                      "your_profile_complete".tr +
                          "80% " +
                          "your_profile_complete2".tr,
                      style: widgets.robotoConsid(fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      widgets.arrowButtonProfile(
                          icon: "profile_circle_outlined",
                          text: 'personal_data1',
                          page: AppRouter.personalData),
                      widgets.arrowButtonProfile(
                        icon: "notification",
                        text: 'notification_settings',
                        page: AppRouter.notifacationsPage,
                      ),
                      widgets.arrowButtonProfile(
                        icon: "",
                        page: AppRouter.addPhone,
                        text: 'my_contacts',
                      ),
                      widgets.arrowButtonProfile(
                        icon: "",
                        text: 'organization',
                        page: AppRouter.organizationPage,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: widgets.editTextButton(
                        icon: 'city',
                        text: (controllerShoppingCart.selectedCity.value ??
                                "specify_the_city".tr) +
                            (controllerShoppingCart.selectedStreetHouse.value ??
                                ""),
                        onTap: () {
                          Get.to(ShippingMethodsPage());
                        }),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: widgets.editTextButton(
                        icon: 'dollar_grey',
                        text: 'Валюта: Кыргызсикий сом',
                        secondIcon: "kyrgyzstan",
                        onTap: () {}),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "language".tr,
                      style: widgets.robotoConsid(),
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 60,
                    child: Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.languageIcons.length,
                        itemBuilder: (context, index) {
                          return Obx(() {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: widgets.customButton(
                                onTap: () {
                                  controller.selectedLang.value =
                                      controller.languageIcons[index];

                                  controller.changeLang();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color:
                                              controller.selectedLang.value ==
                                                      controller
                                                          .languageIcons[index]
                                                  ? AppTextStyles.colorBlueMy
                                                  : Colors.white)),
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: controller.languageIcons[index] ==
                                            "en"
                                        ? widgets.imagePng(name: "lang/en.png")
                                        : widgets.anySvg(
                                            nameSvg:
                                                "lang/${controller.languageIcons[index]}",
                                            size: Size(40, 40)),
                                  ),
                                ),
                              ),
                            );
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      "app_theme".tr,
                      style: widgets.robotoConsid(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widgets.radioTheme(index: 0, text: "light"),
                      widgets.radioTheme(index: 1, text: "dark"),
                    ],
                  ),
                  SizedBox(height: 15),
                  widgets.helpDariaNew(),
                  SizedBox(height: 50),
                  widgets.customButton(
                    onTap: () {
                      Prefs.isLogin = false;
                      Get.back();
                    },
                    child: Container(
                      color: Colors.transparent,
                      width: Get.width,
                      height: 50,
                      child: Center(
                        child: Text(
                          "exit_application".tr,
                          style: widgets.robotoConsid(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTextStyles.colorBlueMy),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  widgets.bottomInfoBar()
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
