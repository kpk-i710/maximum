import 'package:get/get.dart';

import '../../helpers/helper.dart';
import '../../models/app_banner.dart';
import '../../models/catalog.dart';
import '../../models/product.dart';
import '../../repositories/app_repo.dart';
import '../../repositories/catalog_repo.dart';
import '../../repositories/product_repo.dart';

class ProductsByCatalogPageController extends GetxController {
  final productsList = <Product>[].obs;
  final bestsellerProductsList = <Product>[].obs;
  final bannerList = <AppBanner>[].obs;
  final catalogList = <Catalog>[].obs;

  final productsViewType = 'grid'.obs;

  final _productRepo = Get.find<ProductRepo>();
  final _appRepo = Get.find<AppRepo>();
  final _catalogRepo = Get.find<CatalogRepo>();

  int categoryId = 0;

  @override
  void onInit() {
    print("обновился точ");
    categoryId = Get.arguments['id'] as int  ;
    refreshAll();
    super.onInit();
  }

  refreshAll() {
    _productRepo.getProductListByCategory(categoryId).then((value) {
      productsList.value = value;
    });
    _productRepo.getBestsellerProductList().then((value) {
      bestsellerProductsList.addAll(value);
      bestsellerProductsList.refresh();
    });

    _appRepo.getBannerList().then((response) {
      bannerList.addAll(response.body);
      bannerList.refresh();
    });

    _catalogRepo.getSeasonCatalogList().then((value) {
      catalogList.addAll(value.body);
      catalogList.refresh();
    });
  }

  clearAll() {
    productsList.clear();
    productsList.refresh();

    bestsellerProductsList.clear();
    bestsellerProductsList.refresh();

    bannerList.clear();
    bannerList.refresh();

    catalogList.clear();
    catalogList.refresh();
  }

  void changeViewType(type) {
    productsViewType.value = type;
  }

  void tabSelect(int index) => Helper.tabSelect(index);

  Future<void> onRefresh() async {
    clearAll();
    refreshAll();
  }

  @override
  void onClose() {
    bannerList.close();
    catalogList.close();
    productsViewType.close();
    productsList.close();
    bestsellerProductsList.close();
    super.onClose();
  }
}
