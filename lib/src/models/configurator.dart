import 'dart:convert';

List<Configurator> configuratorFromJson(String str) => List<Configurator>.from(json.decode(str).map((x) => Configurator.fromJson(x)));

String configuratorToJson(List<Configurator> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Configurator {
  Configurator({
   required this.title,
    required this.image,
    required this.category,
  });

  String title;
  String image;
  int category;

  factory Configurator.fromJson(Map<String, dynamic> json) => Configurator(
    title: json["title"],
    image: json["image"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image": image,
    "category": category,
  };
}