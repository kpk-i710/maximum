import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../../models/news.dart';
import '../../repositories/app_repo.dart';

class AllPromotionsController extends GetxController {
  final promotionsList = <News1>[].obs;
  final _appRepo = Get.find<AppRepo>();
  void tabSelect(int index) => Helper.tabSelect(index);

  @override
  void onInit() {
    _appRepo.getNewsList(pageSize: 100, sort: '-id').then((response) {
      promotionsList.addAll(response.body);
      promotionsList.refresh();
    });
    super.onInit();
  }

  @override
  void dispose() {

    promotionsList.clear();
    // TODO: implement dispose
    super.dispose();
  }

}
