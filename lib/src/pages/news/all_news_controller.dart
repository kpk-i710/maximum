import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import '../../models/news.dart';
import '../../repositories/app_repo.dart';

class AllNewsController extends GetxController {
  final newsList = <News1>[].obs;
  final _appRepo = Get.find<AppRepo>();
  void tabSelect(int index) => Helper.tabSelect(index);


  @override
  void onInit() {
    _appRepo.getNewsList(pageSize: 100, sort: '-id').then((response) {
      newsList.addAll(response.body);
      newsList.refresh();
    });
    super.onInit();
  }

  @override
  void dispose() {
    newsList.clear();
    // TODO: implement dispose
    super.dispose();
  }
}
