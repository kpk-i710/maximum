import 'package:maxkgapp/src/const/const.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import 'app_model.dart';

class CatalogHist extends AppModel {
  List<Catalog>? catalogList;
  String? path;
  List<Catalog>? hist;

  CatalogHist({this.catalogList, this.path, this.hist});

  CatalogHist.fromMap(map) {
    catalogList = (map['model'] as List).map((e) => Catalog.fromMap1(e)).toList();
    path = map['path'];
    hist = Catalog.fromList(map['hist']);
  }
}

class Catalog extends AppModel {
  late int id;
  int? sid;
  String? name;
  String? image;
  late dynamic parent;
  late bool isLeaf;
  List<Catalog>? children;

  Catalog({
    this.id = -1,
    this.sid,
    this.name,
    this.image,
    this.parent = 0,
    this.children,
    this.isLeaf = false});

  Catalog.fromMap(Map<String, dynamic> map) {
    id = parseInt(map['id']);
    sid = parseInt(map['sid']);
    name = map['name'] ?? '';
    image = map['icon'] ?? '';
    parent = parseInt(map['parent']);
    isLeaf = parseInt(map['is_leaf'], defVal: 0) == 0 ? true : false;
  }

  Catalog.fromMap1(map) {
    id = parseInt(map['id_cat']);
    name = map['name'];
    isLeaf = parseInt(map['is_leaf']) == 0 ? true : false;
  }

  fromMap(map) {
    return Catalog.fromMap(map);
  }

  String? get imageUrl => Helper.getCorrectUrl(image);

  static List<Catalog> fromList(List<dynamic> list) =>
      list.map((e) => Catalog.fromMap(e)).toList();

  @override
  toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'parent': parent,
        'children': children.toString()
      };
}

class CatalogChild extends Catalog {
  CatalogChild.fromMap(map) {
    id = parseInt(map['id_cat']);
    name = map['name'];
    image = map['icon'];
    isLeaf = parseInt(map['is_leaf']) == 0 ? true : false;
  }
}