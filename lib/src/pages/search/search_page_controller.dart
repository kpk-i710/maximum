import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/helper.dart';
import '../../models/product.dart';
import '../../models/catalog.dart';
import '../../repositories/catalog_repo.dart';
import '../../repositories/product_repo.dart';

class SearchPageController extends GetxController {
  final productsList = <Product>[].obs;
  final categoriesList = <Catalog>[].obs;

  final searchList = <String>[].obs;

  final _productRepo = Get.find<ProductRepo>();
  final _catalogRepo = Get.find<CatalogRepo>();

  final productsViewType = 'grid'.obs;

  final searchFieldController = TextEditingController();
  String searchText = '';
  final searchTextObs = ''.obs;
  final _showResults = false.obs;
  final _loading = 100.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments == null || !(Get.arguments is String))
      throw Exception('Null or wrong arguments exception');

    searchFieldController.addListener(() {
      String text = searchFieldController.text;
      searchTextObs.value = text;
      if (text.isEmpty)
        _showResults.value = false;
      else if (text[text.length - 1] == ' ') search(showResults: false);
    });

    searchText = Get.arguments as String;
    searchFieldController.text = searchText;
    _showResults.value = true;
    refreshAll();
  }

  void tabSelect(index) => Helper.tabSelect(index);

  void search({bool showResults = true}) {
    String text = searchFieldController.text;
    if (text.trim().isNotEmpty) {
      _showResults.value = showResults;
      searchText = text;
      clearAll();
      refreshAll();
    }
  }

  void clearAll() {
    productsList.clear();
    productsList.refresh();

    categoriesList.clear();
    categoriesList.refresh();
  }

  refreshAll() {
    _loading.value = 0;

    _productRepo.search(searchText).then((products) {
      _loading.value += 50;
      productsList.addAll(products);
      productsList.refresh();
    });

    _catalogRepo.search(searchText).then((categories) {
      _loading.value += 50;
      categoriesList.addAll(categories);
      categoriesList.refresh();
    });
  }

  bool showResults() => _showResults.value;
  bool isLoading() => _loading.value != 100;
  bool hasResults() => productsList.isNotEmpty || categoriesList.isNotEmpty;

  void changeViewType(type) {
    productsViewType.value = type;
  }

  Future<void> onRefresh() async {
    clearAll();
    refreshAll();
  }

  @override
  void onClose() {
    _loading.close();
    _showResults.close();
    searchTextObs.close();
    productsViewType.close();
    categoriesList.close();
    productsList.close();
    searchList.close();
    super.onClose();
  }
}
