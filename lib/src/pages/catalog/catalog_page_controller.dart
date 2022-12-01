import 'package:get/get.dart';

import '../../helpers/app_router.dart';
import '../../models/catalog.dart';
import '../../repositories/catalog_repo.dart';
import '../products_by_catalog/products_by_catalog_page.dart';

class CatalogPageController extends GetxController {
  final _catalogRepo = Get.find<CatalogRepo>();

  bool _loading = false;

  bool get isLoading => _loading;

  bool _home = true;

  bool get home => _home;

  List<Catalog> _homeCatalogList = [];
  List<Catalog> _catalogList = [];
  List<Catalog> _histList = [];

  List<Catalog> get catalogList => _home ? _homeCatalogList : _catalogList;

  List<Catalog> get histList => _histList;

  @override
  void onInit() {
    getHomeCatalogList().then((value) => openCatalog(catalogList[23]));
    super.onInit();
  }

  void openCatalog(Catalog catalog) {
    if (!catalog.isLeaf) {
      Get.back();

      Get.toNamed(AppRouter.productsByCatalog, arguments: {
        "id": catalog.id,
        "title": catalog.name,
      });

      return;
    }

    _home = false;
    update();

    getCatalogList(catalog.id);
  }

  void backToCatalog(Catalog catalog) {
    _catalogList.clear();
    update();

    getCatalogList(catalog.parent);
  }

  void back() {
    if (_histList.length > 1) {
      backToCatalog(_histList.last);
    } else {
      backHome();
    }
  }

  void backHome() {
    _home = true;
    _histList.clear();
    update();
  }

  Future<void> getHomeCatalogList() async {
    _loading = true;
    update();

    final response = await _catalogRepo.getHomeCatalogList();
    if (response.isOk) {
      _homeCatalogList = response.body;
    }

    _loading = false;
    update();
  }

  Future<void> getCatalogList(int id) async {
    _loading = true;
    update();

    final response = await _catalogRepo.getInnerCatalogHistList(id);
    if (response.isOk) {
      _catalogList = response.body.catalogList;
      _histList = response.body.hist;
    }

    _loading = false;
    update();
  }

  Future<void> onRefresh() async {}
}
