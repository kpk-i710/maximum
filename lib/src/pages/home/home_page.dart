import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/news/all_news_swiper.dart';
import 'package:maxkgapp/src/widgets/popular_goods/popular_goods_grid_widget.dart';
import 'package:maxkgapp/src/widgets/promotions_widgets/promotions_swiper.dart';
import '../../helpers/app_router.dart';
import '../../widgets/bought_today/bought_today_grid_widget.dart';
import '../../widgets/brand_offers/brand_offers_grid_widget.dart';
import '../../widgets/brands/brand_grid_widget.dart';
import '../../widgets/discount_widgets/discount_grid_widget.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../widgets/banner_widget.dart';
import '../../widgets/popular_categories/popular_categories_grid_widget.dart';
import '../../widgets/search_widget_2/searchWidget.dart';
import '../../widgets/product_widgets/products_carousel_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';
import '../../helpers/prefs.dart';
import '../news/all_news_page.dart';
import '../shopping_cart/before_payment_delivry/shipping_methods/shipping_methods_page.dart';
import '../shopping_cart/shopping_cart_page_controller.dart';
import 'home_page_controller.dart';

class HomePage extends StatelessWidget {
  final homeController = Get.put(HomePageController());
  final controllerShoppingCart = Get.put(ShoppingCartPageController());

  HomePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Get.context!.theme.background,
        body: SafeArea(
          child: RefreshIndicator(
              onRefresh: homeController.onRefresh,
              child: ListView.builder(
                  itemCount: kDebugMode == true ? 1 : null,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SearchWidget(),
                        Obx(() {
                          return widgets.location(
                              adress:
                                  (controllerShoppingCart.selectedCity.value ??
                                          "Укажите город") +
                                      (controllerShoppingCart
                                              .selectedStreetHouse.value ??
                                          ""),
                              onTap: () {
                                Get.to(ShippingMethodsPage());
                              });
                        }),
                        Obx(() => BannerWidget(
                            list: homeController.bannerList.value)),
                        if (Prefs.isLogin)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  SizedBox(width: 15),
                                  widgets.anySvg(
                                      nameSvg: 'person_outline',
                                      size: Size(20, 20)),
                                  SizedBox(width: 15),
                                  Text('Добро пожаловать Екатерина!',
                                      style: widgets.robotoConsid(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 10),
                              widgets.homeButton(
                                  icon: 'checkMark',
                                  text: 'current_orders',
                                  page: AppRouter.currentOrders),
                              const SizedBox(height: 10),
                              widgets.homeButton(
                                  icon: 'bell',
                                  text: 'notifications',
                                  page: AppRouter.notificationsDelivry),
                              const SizedBox(height: 10),
                              // Get.toNamed(AppRouter.currentOrders);
                            ],
                          ).paddingSymmetric(horizontal: 12),
                        if (Prefs.isLogin)
                          Container(
                            color: AppTextStyles.colorFocus,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 20),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: homeController.left),
                                  child: Text(
                                    'you_watched'.tr,
                                    style: widgets.robotoConsid(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Obx(() => Padding(
                                      padding: EdgeInsets.only(
                                          left: homeController.left),
                                      child: ProductsCarouselWidget(
                                        list: homeController
                                            .viewedProductsList.value,
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        SizedBox(height: 30),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: homeController.left),
                              child: Text(
                                'popular_categories'.tr.toUpperCase(),
                                style: widgets.robotoConsid(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Obx(() => PopularCategoriesGridWidget(
                                  list:
                                      homeController.seasonCategoriesList.value,
                                  countAxis: 2,
                                  maxHeight: 350,
                                  itemCount: 8,
                                )),
                          ],
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: EdgeInsets.only(left: homeController.left),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              widgets.titleWidget(title: 'bought_today'.tr),
                              Obx(() => BoughtTodayGridWidget(
                                    list: homeController.discountList.value,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            widgets.titleWidget(
                                title: 'promotions'.tr,
                                onTap: () {
                                  Get.toNamed(AppRouter.allPromotionsPage);
                                },
                                isTrailing: true),
                            Column(
                              children: [
                                PromotionsSwiperWidget(
                                  list: homeController.newsList,
                                ),
                                SizedBox(height: 20),

                              ],
                            ),
                          ],
                        ).paddingSymmetric(horizontal: homeController.left),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Column(
                            children: [
                              SizedBox(height: 20),
                              widgets.titleWidget(
                                title: 'brand_offers'.tr,
                              ),
                              widgets.subTitleWidget(
                                title: 'Asus',
                              ),
                              Obx(() => BrandOffersGridWidget(
                                    list: homeController.discountList.value,
                                  )),
                              SizedBox(height: 10),
                              widgets.subTitleWidget(
                                title: 'Мечта',
                              ),
                              Obx(() => BrandOffersGridWidget(
                                    list: homeController.discountList.value,
                                  )),
                              SizedBox(height: 10),
                              widgets.subTitleWidget(
                                title: 'Launch',
                              ),
                              Obx(() => BrandOffersGridWidget(
                                    list: homeController.discountList.value,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              widgets.titleWidget(
                                  title: 'discounts'.tr,
                                  isTrailing: true,
                                  onTap: () {
                                    Get.toNamed(AppRouter.discountList);
                                  }),
                              Obx(() => DiscountGridWidget(
                                    list: homeController.discountList.value,
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              widgets.titleWidget(
                                  title: 'news'.tr,
                                  isTrailing: true,
                                  rightTrailing: 15,
                                  onTap: () {
                                    Get.to(AllNewsPage());
                                  }),
                              AllNewsSwiper(
                                list: homeController.newsList,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            children: [
                              widgets.titleWidget(
                                title: 'brands'.tr,
                              ),
                              BrandGridWidget(),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Column(
                          children: [
                            widgets.titleWidget(
                              title: 'popular_goods'.tr,
                            ),
                            Obx(() => PopularGoodsGridWidget(
                                  list: homeController.discountList.value,
                                )),
                          ],
                        ).paddingSymmetric(horizontal: 10),
                        // widgets
                        //     .titleWidget(
                        //       title: 'season_categories'.tr,
                        //     )
                        //     .paddingSymmetric(horizontal: 12),
                        // Obx(() => CatalogGridWidget(
                        //       list: homeController.seasonCategoriesList.value,
                        //     )),
                        const SizedBox(height: 20.0),
                      ],
                    );
                  })),
        ));
  }
}
