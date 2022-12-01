import '../const/const.dart';
import 'app_model.dart';

class AppBanner extends AppModel {
  AppBanner({this.id = 0, this.title, this.url, this.sidCat, this.showAll});

  int id;
  String? title;
  String? url;
  int? sidCat;
  int? showAll;

  factory AppBanner.fromMap(map) => AppBanner(
      id: map['id'],
      title: map['naim'],
      url: map['url'],
      sidCat: map['sid_cat'],
      showAll: map['show_all']);

  static List<AppBanner> fromMapList(List<dynamic> list) =>
      list.map((map) => AppBanner.fromMap(map)).toList();

  String get bigImage => Const.BANNER_BIG_IMAGE_URL.replaceAll('{id}', '$id');

  @override
  toMap() => {
    'id': id,
    'naim': title,
    'url': url,
    'sid_cat': sidCat,
    'showAll': showAll,
  };
}
