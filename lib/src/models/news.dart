import 'package:maxkgapp/src/helpers/helper.dart';

import 'app_model.dart';

class News1 extends AppModel {
  News1({this.id = -1, this.title, this.date, this.text, this.views = 0, this.logo});

  late int id;
  String? title;
  String? text;
  String? date;
  late int views;
  String? logo;

  String? get logoUrl => Helper.getCorrectUrl(logo);

  News1.fromMap(map) {
    id = parseInt(map['id']);
    title = map['naim'];
    text = map['text'];
    date = map['dat1'];
    views = map['view'];
    logo = map['logo'];
  }

  static fromMapList(List<dynamic> list) =>
      list.map((e) => News1.fromMap(e)).toList();

  @override
  toMap() => {
    'id': id,
    'naim': title,
    'text': text,
    'dat1': date,
    'view': views,
    'logo': logo,
  };
}