import 'app_model.dart';

class AppNotification extends AppModel {
  String? title;
  String? date;
  String? time;
  String? text;

  AppNotification({this.title, this.text, this.date, this.time});
}
