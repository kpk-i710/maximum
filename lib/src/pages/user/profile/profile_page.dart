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
          child: GestureDetector(
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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              widgets.helpDaria(),
              Prefs.isLogin
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: widgets.currencyAndCityWidget(),
                    )
                  : SizedBox(
                      height: 25,
                    ),
              Text(
                "reference_information".tr,
                style: widgets.robotoConsid(fontSize: 14),
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
            ],
          ),
        ),
        const SizedBox(height: 40),
        widgets.bottomInfoBar()
      ],
    );
  }
}

// Widget authorizedProfile(BuildContext context) {
//   return Column(
//     children: [
//       Container(
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
//         child: Column(
//           children: [
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 80,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.toNamed(AppRouter.profileParams);
//                     },
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           'Мурахмедов Анвар Рашидович',
//                           style: AppTextStyles.robotoCondensed(
//                               fontSize: 18, fontWeight: FontWeight.w800),
//                         ),
//                         const SizedBox(height: 5),
//                         Row(
//                           children: [
//                             const AppIcon(AppIcons.profile_circle_outlined,
//                                 size: 18),
//                             const SizedBox(width: 5),
//                             Text(
//                               'my_settings'.tr,
//                               style: AppTextStyles.mPlusRounded1c(
//                                   fontSize: 14, fontWeight: FontWeight.w400),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 70,
//                     child: IntrinsicHeight(
//                       child: Row(
//                         children: [
//                           const VerticalDivider(thickness: 1.3),
//                           const SizedBox(width: 15),
//                           AppIcon(
//                             AppIcons.notification,
//                             size: 28,
//                             color: context.theme.grey,
//                           ),
//                           const SizedBox(width: 15),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 15),
//             widgets.customMenuList(list: [
//               MenuItem(
//                   leading:
//                       const AppIcon(AppIcons.checkbox_list_line, size: 20),
//                   title: 'current_orders_menu'
//                       .trParams({'suffix': ':', 'count': '2'}),
//                   page: AppRouter.currentOrders),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.check_list, size: 20),
//                   title: 'order_hist_menu'.tr,
//                   page: AppRouter.orderHist),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.notification, size: 20),
//                   title: 'notifications_menu'
//                       .trParams({'suffix': ':', 'count': '1'}),
//                   page: AppRouter.notifications),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.like_outlined, size: 20),
//                   title:
//                       'favorites_menu'.trParams({'suffix': '', 'count': '1'}),
//                   page: AppRouter.favorite),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.discount, size: 20),
//                   title: 'discounts'.tr,
//                   page: AppRouter.discount),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.discount, size: 20),
//                   title: 'promotions'.tr,
//                   page: AppRouter.discountList),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.discount, size: 20),
//                   title: 'news'.tr),
//             ]),
//           ],
//         ),
//       ),
//       const SizedBox(height: 20),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: widgets.currencyAndCityWidget(),
//       ),
//       const SizedBox(height: 30),
//       Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//         decoration: const BoxDecoration(
//           color: const Color(0xFFF0F3F8),
//         ),
//         child: Column(
//           children: [
//             Row(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(50),
//                   child: Image.asset('assets/images/instagram.png',
//                       width: 90, height: 90, fit: BoxFit.cover),
//                 ),
//                 const SizedBox(width: 18),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'your_personal_manager'.tr + ':',
//                       style: AppTextStyles.robotoCondensed(
//                           fontSize: 14, fontWeight: FontWeight.w400),
//                     ),
//                     const SizedBox(height: 5),
//                     Text('Мурахмедов Анвар',
//                         style: AppTextStyles.robotoCondensed(
//                             fontSize: 24,
//                             fontWeight: FontWeight.w700,
//                             color: context.theme.primary)),
//                     const SizedBox(height: 2),
//                     for (int i = 0; i < 3; i++)
//                       Text('0553 931111 доб. 114',
//                               style: AppTextStyles.robotoCondensed(
//                                   fontSize: 14, fontWeight: FontWeight.w400))
//                           .marginOnly(bottom: 2),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(height: 32),
//             widgets
//                 .fullWidthButton(
//                     text: 'call_me'.tr,
//                     icon: AppIcons.person,
//                     onPressed: () {})
//                 .paddingSymmetric(horizontal: 8),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//       const SizedBox(height: 30),
//       Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Column(
//           children: [
//             widgets.customMenuList(list: [
//               MenuItem(
//                   leading: const AppIcon(AppIcons.bus, size: 20),
//                   title: 'reference_information'.tr),
//               MenuItem(
//                   leading: const AppIcon(AppIcons.bus, size: 20),
//                   title: 'about_company'.tr,
//                   page: AppRouter.aboutCompany),
//             ]),
//             const SizedBox(height: 30),
//             widgets.fullWidthButton(
//                 text: 'support'.tr,
//                 icon: AppIcons.chat,
//                 onPressed: () {
//                   Get.toNamed(AppRouter.auth);
//                 }),
//             const SizedBox(height: 30),
//           ],
//         ),
//       ),
//     ],
//   );
// }
