import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import '../../models/news.dart';
import '../../repositories/app_repo.dart';

class AllNewsController extends GetxController {
  final newsList = <News1>[].obs;
  final _appRepo = Get.find<AppRepo>();
  void tabSelect(int index) => Helper.tabSelect(index);
  String getDate(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd hh:mm:ss").parse(date);
    print("день появления");
    print(tempDate.day);
    print("разница");
    final dates = (DateFormat('d').format(DateTime.now()));

    tempDate.difference(DateTime.now()).inDays;
    if (tempDate
            .difference(DateTime.now())
            .inDays
            .toString()
            .replaceAll("-", "") ==
        "0") return "today".tr;
    return tempDate
        .difference(DateTime.now())
        .inDays
        .toString()
        .replaceAll("-", "") + " " + "daysShort".tr;
  }

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
