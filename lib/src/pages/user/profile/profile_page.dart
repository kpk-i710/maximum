import 'package:flutter/material.dart' hide MenuItem;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import '../../../helpers/prefs.dart';
import '../../../styles.dart';
import '../../../widgets/app_icon.dart';
import '../../../widgets/widgets.dart' as widgets;
import 'profile_page_controller.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: GetBuilder<ProfilePageController>(
              init: ProfilePageController(),
              builder: (controller) => controller.isLogin
                  ? authorizedProfile(context)
                  : notAuthorizedProfile(context)),
        ),
      ),
    );
  }

  Widget authorizedProfile(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.centerLeft, stops: [
            0.0,
            0.8,
          ], colors: [
            Color(0xff112B66),
            Color(0xff53235A),
          ])),
          child: widgets.customButton(
            onTap: () {
              Get.toNamed(AppRouter.profileParams);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          const AppIcon(AppIcons.profile_circle_outlined,
                              size: 18, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Мурахмедов Анвар Рашидович',
                            style: widgets.robotoConsid(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          SizedBox(width: 25),
                          Text(
                            'my_settings'.tr,
                            style: widgets.robotoConsid(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/icons/white_bell.svg'),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: widgets.boxShadows(
              child: Container(
            height: 35,
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/discounts.svg'),
                SizedBox(width: 17),
                Text(
                  "personal_discount".tr,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          )),
        ),
        authorized_and_unauthorized(),
      ],
    );
  }

  Widget notAuthorizedProfile(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 26.0, right: 26.0, top: 31.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'loginInAccount'.tr,
                    style: widgets.robotoConsid(),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              widgets.loginButtonNew(
                  text: 'login_or_register_plural'.tr,
                  onPressed: () {
                    Get.toNamed(AppRouter.authByPhone);
                  }),
            ],
          ),
        ),
        const SizedBox(height: 21),
        authorized_and_unauthorized(),
      ],
    );
  }

  Widget authorized_and_unauthorized() {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgets.arrowButtonProfile(
                icon: "bell",
                text: 'Конфигуратор',
                page: AppRouter.configurator),
            widgets.arrowButtonProfile(
                icon: "bell",
                text: 'notifications',
                notification: true,
                page: AppRouter.notificationsDelivry),
            Prefs.isLogin
                ? widgets.arrowButtonProfile(
                    icon: "checkMark",
                    text: 'current_orders',
                    page: AppRouter.currentOrders)
                : SizedBox(),
            Prefs.isLogin
                ? widgets.arrowButtonProfile(
                    icon: "purchase_history",
                    text: 'order_history',
                    page: AppRouter.orderHist)
                : SizedBox(),
            widgets.arrowButtonProfile(
                icon: "favorites",
                text: 'favorite',
                notification: true,
                page: AppRouter.favorite,
                isActive: false),
            widgets.arrowButtonProfile(
                icon: "discounts",
                text: 'discounts',
                page: AppRouter.discountList),
            widgets.arrowButtonProfile(
                icon: "stock",
                text: 'promotions',
                page: AppRouter.allPromotionsPage),
            widgets.arrowButtonProfile(
                icon: "news", text: 'news', page: AppRouter.allNewsPage),
            const SizedBox(height: 27),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: widgets.helpDaria(),
            ),
            Prefs.isLogin
                ? Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 20),
                    child: widgets.currencyAndCityWidget(),
                  )
                : SizedBox(
                    height: 25,
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26.0),
              child: Text(
                "reference_information".tr,
                style: widgets.robotoConsid(fontSize: 14),
              ),
            ),
            SizedBox(height: 10),
            widgets.arrowButtonProfile(
                icon: "delivery_and_timing", text: 'delivery_and_terms'),
            widgets.arrowButtonProfile(
                icon: "payment_and_installments",
                text: 'payment_and_installments'),
            widgets.arrowButtonProfile(
                icon: "pick_up_points", text: 'pickup_points'),
            widgets.arrowButtonProfile(
                icon: "organizations_and_businesses",
                text: 'organizations_and_business'),
            widgets.arrowButtonProfile(icon: "faq", text: 'faq'),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "language".tr,
                style: widgets.robotoConsid(),
              ),
            ),
            Obx(() {
              return widgets.chooseLang();
            }),
          ],
        ),
        const SizedBox(height: 40),
        widgets.bottomInfoBar()
      ],
    );
  }
}
