import 'dart:convert';

List<Configurator> configuratorFromJson(String str) => List<Configurator>.from(json.decode(str).map((x) => Configurator.fromJson(x)));

String configuratorToJson(List<Configurator> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Configurator {
  Configurator({
   required this.title,
   required this.titleSelected,
   required this.price,
    required this.image,
    required this.category,
  });

  String title;
  String titleSelected;
  String image;
  int category;
  int price;

  factory Configurator.fromJson(Map<String, dynamic> json) => Configurator(
    title: json["title"],
    titleSelected: json["titleSelected"],
    image: json["image"],
    price: json["price"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "titleSelected": titleSelected,
    "image": image,
    "price": price,
    "category": category,
  };
}