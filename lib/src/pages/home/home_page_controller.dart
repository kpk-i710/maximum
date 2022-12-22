import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/models/news.dart';
import '../../models/app_banner.dart';
import '../../models/discount.dart';
import '../../repositories/catalog_repo.dart';
import '../../repositories/product_repo.dart';
import '../../repositories/app_repo.dart';
import '../../repositories/discount_repo.dart';
import '../../models/product.dart';
import '../../models/catalog.dart';
import '../../widgets/widgets.dart' as widgets;
class HomePageController extends GetxController {


  final _appRepo = Get.find<AppRepo>();
  final _productRepo = Get.find<ProductRepo>();
  final _catalogRepo = Get.find<CatalogRepo>();
  final _discountRepo = Get.find<DiscountRepo>();
  void tabSelect(int index) => Helper.tabSelect(index);
  final viewedProductsList = <Product>[].obs;
  final bestsellerProductsList = <Product>[].obs;
  final trendProductsList = <Product>[].obs;
  final discountProductsList = <Product>[].obs;

  final discountList = <Discount>[].obs;

  final seasonCategoriesList = <Catalog>[].obs;

  final bannerList = <AppBanner>[].obs;
  final discountBannerList = <AppBanner>[].obs;

  final newsList = <News1>[].obs;




  @override
  void onInit() {
    super.onInit();
    refreshAll();
  }

  Future<void> refreshAll() async {
    print('token ${Prefs.token.access}');
    _productRepo.getViewedProductList().then((value) {
      viewedProductsList.value = value;
    });
    _productRepo.getBestsellerProductList().then((value) {
      bestsellerProductsList.value = value;
    });
    _productRepo.getTrendProductList().then((value) {
      trendProductsList.value = value;
    });
    _productRepo.getDiscountProductList().then((value) {
      discountProductsList.value = value;
    });

    _catalogRepo.getSeasonCatalogList().then((response) {
      seasonCategoriesList.addAll(response.body);
      seasonCategoriesList.refresh();
    });

    _appRepo.getBannerList().then((response) {
      bannerList.addAll(response.body);
      bannerList.refresh();
    });
    _appRepo.getDiscountBannerList().then((response) {
      discountBannerList.addAll(response.body);
      discountBannerList.refresh();
    });
    _appRepo.getNewsList(pageSize: 100, sort: '-id').then((response) {
      newsList.addAll(response.body);
      newsList.refresh();
    });

    _discountRepo.getDiscountList(limit: 4).then((value) {
      discountList.addAll(value.body);
      discountList.refresh();
    });
  }

  clearAll() {
    viewedProductsList.clear();
    viewedProductsList.refresh();

    bestsellerProductsList.clear();
    bestsellerProductsList.refresh();

    discountList.clear();
    discountList.refresh();

    trendProductsList.clear();
    trendProductsList.refresh();

    discountProductsList.clear();
    discountProductsList.refresh();

    seasonCategoriesList.clear();
    seasonCategoriesList.refresh();

    bannerList.clear();
    bannerList.refresh();

    discountBannerList.clear();
    discountBannerList.refresh();

    discountList.clear();
    discountList.refresh();

    newsList.clear();
    newsList.refresh();
  }

  Future<void> onRefresh() async {
    clearAll();
    await refreshAll();
  }

  @override
  void onClose() {
    viewedProductsList.close();
    bestsellerProductsList.close();
    trendProductsList.close();
    discountProductsList.close();
    discountList.close();
    seasonCategoriesList.close();
    bannerList.close();
    discountBannerList.close();
    newsList.close();

    super.onClose();
  }
}
