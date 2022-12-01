import '../helpers/helper.dart';

extension StringExtensions on String {
  bool get isNullOrEmpty => this == null || this.isEmpty;
}

extension NullableStringExtensions on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

class AppModel {
  final String table = "app_model";

  late int id;
  String? heroTag;

  AppModel({this.id = 0, this.heroTag});

  AppModel.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? '0';
  }

  fromMap(map) {
    return AppModel.fromMap(map);
  }

  parseInt(val, {int? defVal}) => Helper.parseInt(val, defVal: defVal);
  parseDouble(val, {double? defVal}) => Helper.parseDouble(val, defVal: defVal);

  toMap() => {'id': id};
}
