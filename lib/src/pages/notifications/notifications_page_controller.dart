import 'package:get/get.dart';
import '../../models/notification.dart';
import '../../repositories/app_repo.dart';

class NotificationsPageController extends GetxController {
  final notfList = <AppNotification>[].obs;

  final _appRepo = Get.find<AppRepo>();

  @override
  void onInit() {
    super.onInit();
    refreshAll();
  }

  refreshAll() async {
    _appRepo.getNotificationsList().then((value) {
      notfList.addAll(value);
      notfList.refresh();
    });
  }

  clearAll() {
    notfList.clear();
    notfList.refresh();
  }

  Future<void> onRefresh() async {
    clearAll();
    refreshAll();
  }

  @override
  void onClose() {
    notfList.close();
    super.onClose();
  }
}
