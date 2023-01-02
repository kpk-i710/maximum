import 'package:get/get.dart';

import '../../helpers/helper.dart';
import '../../models/app_banner.dart';
import '../../models/catalog.dart';
import '../../models/product.dart';
import '../../repositories/app_repo.dart';
import '../../repositories/catalog_repo.dart';
import '../../repositories/product_repo.dart';

class ProductsByCatalogPageController extends GetxController {

  void tabSelect(int index) => Helper.tabSelect(index);

  var currentVersionCatalog = 0.obs;

}
