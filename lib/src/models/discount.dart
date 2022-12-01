import 'package:maxkgapp/src/models/product.dart';

import '../helpers/helper.dart';
import 'app_model.dart';

class Discount extends AppModel {
  late int id;
  String? title;
  String? shortDescription;
  String? description;
  List<DiscountBonus>? bonuses;
  int? numberOfUsages;
  int? days;
  int? hours;
  String? wordDay;
  String? word;
  String? message;
  String? image;
  int? fromDate;
  int? toDate;
  List<Product>? products;

  int? get discountValue => bonuses != null && bonuses!.first != null
      ? bonuses!.first.discountValue ?? 0 : 0;
  String? get imageUrl => Helper.getCorrectUrl(image);
  DateTime get fromDateTime => DateTime.fromMillisecondsSinceEpoch(fromDate! * 1000);
  DateTime get toDateTime => DateTime.fromMillisecondsSinceEpoch(toDate! * 1000);

  Discount({this.id = -1, this.image, this.title, this.message, this.bonuses,
    this.days, this.description, this.hours, this.numberOfUsages,
    this.shortDescription, this.word, this.wordDay,
    this.fromDate, this.toDate, this.products});

  Discount.fromMap(map) {
    id = parseInt(map['promotion_id']);
    image = map['image'] ?? '';
    title = map['name'];
    shortDescription = map['short_description'];
    description = map['description'];
    bonuses = map['bonuses'] != null ? DiscountBonus.fromList((map['bonuses'] as Map<String, dynamic>)
        .values.toList()) : [];
    numberOfUsages = parseInt(map['number_of_usages']);
    days = parseInt(map['days']);
    hours = parseInt(map['hours']);
    wordDay = map['word_day'];
    word = map['word'];
    message = map['message'];
    fromDate = parseInt(map['from_date']);
    toDate = parseInt(map['to_date']);
    products = map['product'] != null ? Product.fromList(map['product']) : null;
  }

  fromMap(map) => Discount.fromMap(map);
  static fromList(List<dynamic> list) =>
      list.map((m) => Discount.fromMap(m)).toList();

  toMap() => {
    'from_date': fromDate,
    'to_date': toDate,
  };
}

class DiscountBonus extends AppModel {

  DiscountBonus({
    this.bonus,
    this.type,
    this.discountBonus,
    this.discountValue = 0});

  String? bonus;
  String? type;
    int? discountValue;
  String? discountBonus;

  DiscountBonus.fromMap(map) {
    bonus = map['bonus'] ?? '';
    type = map['type'];
    discountValue = parseInt(map['discount_value']);
    discountBonus = map['discount_bonuse'];
  }

  static fromList(List<dynamic> list) =>
      list.map((e) => DiscountBonus.fromMap(e)).toList();

  @override
  toMap() => {
    'bonus': bonus,
    'type': type,
    'discount_bonuse': discountBonus,
  };

}
