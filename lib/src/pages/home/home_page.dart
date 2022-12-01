import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../helpers/app_router.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/bought_today/bought_today_grid_widget.dart';
import '../../widgets/brand_offers/brand_offers_grid_widget.dart';
import '../../widgets/brands/brand_grid_widget.dart';
import '../../widgets/discount_widgets/discount_grid_widget.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/popular_categories/popular_categories_grid_widget.dart';
import '../../widgets/product_widgets/products_grid_widget.dart';
import '../../widgets/search_widget_2/searchWidget.dart';
import '../../widgets/product_widgets/products_carousel_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';
import '../../helpers/prefs.dart';
import '../bestsellers/bestsellers_list_page.dart';
import '../news/all_news_page.dart';
import '../promotions/all_promotions_page.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomePageController());

  HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.context!.theme.background,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: homeController.onRefresh,
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                children: [
                  SearchWidget(),
                  widgets.location(),
                  // SearchBarWidget()
                  //     .paddingSymmetric(horizontal: 12),
                  // const SizedBox(height: 25),
                  Obx(() =>
                      BannerWidget(list: homeController.bannerList.value)),
                  if (Prefs.isLogin)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'hello_user'.trParams({'user': 'Станислав'})!,
                          style: AppTextStyles.robotoCondensed(
                            fontSize: 21,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 10),
                        widgets.fullWidthButton(
                          text: 'current_orders'.tr + ' - 2',
                          icon: AppIcons.car_ride,
                          onPressed: () {
                            Get.toNamed(AppRouter.currentOrders);
                          },
                        ),
                      ],
                    ).paddingSymmetric(horizontal: 12),
                  // Prefs.isLogin
                  //     ? const SizedBox(height: 12)
                  //     : Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //         child: Container(
                  //           color: Colors.blue.shade50,
                  //           child: Column(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Padding(
                  //                 padding: const EdgeInsets.all(20.0),
                  //                 child: Text(
                  //                   "loginInAccount".tr,
                  //                   style: TextStyle(fontFamily: "rounded"),
                  //                 ),
                  //               ),
                  //               widgets.loginButton(
                  //                 onPressed: () {
                  //                   Get.toNamed(AppRouter.auth);
                  //                 },
                  //                 text: 'login_or_register'.tr,
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  if (Prefs.isLogin)
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      color: context.theme.focus,
                      child: Column(
                        children: [
                          widgets
                              .titleWidget('viewed_products'.tr)
                              .paddingSymmetric(horizontal: 12.0),
                          Obx(() => ProductsCarouselWidget(
                                list: homeController.viewedProductsList.value,
                              )),
                        ],
                      ),
                    ),
                  // else
                  //   Column(
                  //     children: [
                  //       widgets.titleWidget('Успей купить',
                  //           suffix: '!', trailing: const SizedBox(width: 0)),
                  //       DiscountWithBorderWidget(
                  //         discount: Discount(id: 23,
                  //           image: 'https://phitensg.com/wp-content/uploads/' +
                  //               '2017/11/online-combo-offer-discount.jpg',
                  //           toDate: 1622224806,
                  //         ),
                  //       ),
                  //     ],
                  //   ).paddingSymmetric(horizontal: 12)

                  // widgets
                  //     .titleWidget('trends'.tr)
                  //     .paddingSymmetric(horizontal: 12),
                  // Container(
                  //   // color: Colors.grey[200],
                  //   child: Obx(() => ProductsGridWidget(
                  //         list: homeController.trendProductsList.value,
                  //         heroTag: 'trend_product_',
                  //       )),
                  // ),
                  // widgets.moreButton(
                  //   onPressed: () {
                  //     Get.snackbar(
                  //       "Недоступно",
                  //       "Пока тренды недоступны",
                  //       snackPosition: SnackPosition.TOP,
                  //       duration: Duration(seconds: 1),
                  //     );
                  //   },
                  //   text: 'show_more'.tr,
                  // ),
                  Column(
                    children: [
                      widgets.titleWidget('bought_today'.tr,
                          onTrailingTap: () {}),
                      Obx(() => BoughtTodayGridWidget(
                            list: homeController.discountList.value,
                          )),
                      widgets.moreButton(
                        onPressed: () {},
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),

                  Column(
                    children: [
                      widgets.titleWidget('popular_categories'.tr,
                          onTrailingTap: () {}),
                      Obx(() => PopularCategoriesGridWidget(
                            list: homeController.seasonCategoriesList.value,
                          )),
                      widgets.moreButton(
                        onPressed: () {},
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),

                  Column(
                    children: [
                      widgets.titleWidget('brand_offers'.tr,
                          onTrailingTap: () {}),
                      Obx(() => BrandOffersGridWidget(
                            list: homeController.discountList.value,
                          )),
                      widgets.moreButton(
                        onPressed: () {},
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),
                  Column(
                    children: [
                      widgets.titleWidget('promotions'.tr),
                      Obx(
                        () => Column(
                          children: [
                            for (int index = 0;
                                index < homeController.newsList.length;
                                index++)
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    AppRouter.listNews,
                                    arguments: {
                                      "idNews":
                                          homeController.newsList[index].id,
                                    },
                                  );
                                },
                                child: widgets
                                    .newsItemWidget(
                                        homeController.newsList[index].logoUrl!)
                                    .marginOnly(bottom: 20),
                              ),
                          ],
                        ),
                      ),
                      widgets.moreButton(
                        onPressed: () {
                          Get.to(AllPromotionsPage());
                        },
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),
                  Column(
                    children: [
                      widgets.titleWidget('popular_goods'.tr,
                          onTrailingTap: () {}),
                      Obx(() => BrandOffersGridWidget(
                            list: homeController.discountList.value,
                          )),
                      widgets.moreButton(
                        onPressed: () {},
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),
                  Column(
                    children: [
                      widgets
                          .titleWidget('brands'.tr,
                              trailing: SizedBox(width: 0))
                          .paddingSymmetric(horizontal: 12),
                      BrandGridWidget(),
                      widgets.moreButton(
                        onPressed: () {},
                        text: 'show_more'.tr,
                      ),
                    ],
                  ),

                  Column(
                    children: [
                      widgets.titleWidget('discounts'.tr, onTrailingTap: () {}),
                      Obx(() => DiscountGridWidget(
                            list: homeController.discountList.value,
                          )),
                      widgets.moreButton(
                        onPressed: () {
                          Get.toNamed(AppRouter.discountList);
                        },
                        text: 'show_more'.tr,
                      ),
                    ],
                  ).paddingSymmetric(horizontal: 12),

                  widgets
                      .titleWidget('season_categories'.tr,
                          trailing: SizedBox(width: 0))
                      .paddingSymmetric(horizontal: 12),
                  Obx(() => CatalogGridWidget(
                        list: homeController.seasonCategoriesList.value,
                      )),

                  // const SizedBox(height: 30),
                  // Obx(() => BannerWidget(
                  //         list: homeController.discountBannerList.value)
                  //     .paddingSymmetric(horizontal: 12)),
                  // const SizedBox(height: 15),
                  // widgets
                  //     .titleWidget('discount_products'.tr)
                  //     .paddingSymmetric(horizontal: 12),
                  // Container(
                  //   color: Colors.grey[200],
                  //   child: Obx(() => ProductsGridWidget(
                  //         list: homeController.discountProductsList.value,
                  //         heroTag: 'discount_product_',
                  //       )),
                  // ),
                  // const SizedBox(height: 40),
                  Column(
                    children: [
                      widgets.titleWidget('news'.tr),
                      Obx(
                        () => Column(
                          children: [
                            for (int index = 0;
                                index < homeController.newsList.length;
                                index++)
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    AppRouter.listNews,
                                    arguments: {
                                      "idNews":
                                          homeController.newsList[index].id,
                                    },
                                  );
                                },
                                child: widgets
                                    .newsItemWidget(
                                        homeController.newsList[index].logoUrl!)
                                    .marginOnly(bottom: 20),
                              ),
                          ],
                        ),
                      ),
                      widgets.moreButton(
                        onPressed: () {
                          Get.to(AllNewsPage());
                        },
                        text: 'show_more'.tr,
                      ),
                      // widgets.supportCenterButton(),
                    ],
                  ).paddingSymmetric(horizontal: 12),

                  const SizedBox(height: 20.0),
                ],
              )),
        ),
      ),
    );
  }
}
