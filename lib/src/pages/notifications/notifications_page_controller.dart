import 'package:get/get.dart';
import 'package:maxkgapp/src/models/notification_all.dart';
import '../../repositories/app_repo.dart';

class NotificationsPageController extends GetxController {
  var newNoti = <NotificationAll>[
    NotificationAll(data: "28.02.2021  13:15", description: "time_delivery"),
    NotificationAll(data: "29.02.2021  13:15", description: "time_delivery"),
    NotificationAll(data: "30.02.2021  13:15", description: "time_delivery"),
  ].obs;

  var oldNoti = <NotificationAll>[].obs;

  nakeOldNoti({required int index}) {
    print("удалил");
    if (newNoti.length >= 1) {
      oldNoti.add(newNoti[index]);
      oldNoti.refresh();
      newNoti.removeAt(index);
      newNoti.refresh();
    }
  }
}
