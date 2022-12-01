import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/favorite.dart';
import '../../models/catalog.dart';
import '../../repositories/product_repo.dart';
import '../../repositories/catalog_repo.dart';

class FavoritePageController extends GetxController {
  final catalogList = <Catalog>[].obs;
  final favoriteProductsList = <Favorite>[].obs;

  final productsViewType = 'grid'.obs;
  final loading = false.obs;

  final productRepo = Get.find<ProductRepo>();
  final catalogRepo = Get.find<CatalogRepo>();

  final scrollController = ScrollController();

  int _page = 1;

  @override
  void onInit() {
    super.onInit();
    refreshAll();
  }

  bool onScrollNotification(ScrollNotification not) {
    if (not is ScrollEndNotification
        && scrollController.position.extentAfter == 0
        && loading.isFalse) {
      loading(true);
      productRepo.getFavoriteProductList(pageSize: 12, page: ++_page).then((value) {
        loading(false);
        favoriteProductsList.addAll(value);
        favoriteProductsList.refresh();
      });
    }

    return true;
  }

  refreshAll() {
    productRepo.getFavoriteProductList(pageSize: 12, page: _page).then((value) {
      favoriteProductsList.addAll(value);
      favoriteProductsList.refresh();
    });

    catalogRepo.getFavoriteCatalogList().then((value) {
      catalogList.addAll(value.body);
      catalogList.refresh();
    });
  }

  void changeViewType(type) {
    productsViewType.value = type;
  }

  @override
  void onClose() {
    productsViewType.close();
    catalogList.close();
    favoriteProductsList.close();
    super.onClose();
  }

}