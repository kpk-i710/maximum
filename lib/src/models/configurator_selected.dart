// To parse this JSON data, do
//
//     final configuratorSelected = configuratorSelectedFromJson(jsonString);

import 'dart:convert';

List<ConfiguratorSelected >  configuratorSelectedFromJson(String str) =>  List<ConfiguratorSelected >.from(json.decode(str)!.map((x) => ConfiguratorSelected.fromJson(x)));

String configuratorSelectedToJson(List<ConfiguratorSelected >  data) => json.encode( List<dynamic>.from(data!.map((x) => x!.toJson())));

class ConfiguratorSelected {
  ConfiguratorSelected({
  required  this.title,
    required this.image,
    required this.category,
    required this.price,
    required this.titleSelected,
  });

  String  title;
  String  image;
  int  category;
  int  price;
  String  titleSelected;

  factory ConfiguratorSelected.fromJson(Map<String, dynamic> json) => ConfiguratorSelected(
    title: json["title"],
    image: json["image"],
    category: json["category"],
    price: json["price"],
    titleSelected: json["titleSelected"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "category": category,
    "price": price,
    "titleSelected": titleSelected,
  };
}
