import 'dart:convert';

AddressEnter addressEnterFromJson(String str) => AddressEnter.fromJson(json.decode(str));

String addressEnterToJson(AddressEnter data) => json.encode(data.toJson());

class AddressEnter {
  AddressEnter({
    required this.street,
    required this.house,
    required this.apartament,
  });

  String street;
  String house;
  String apartament;

  factory AddressEnter.fromJson(Map<String, dynamic> json) => AddressEnter(
    street: json["street"],
    house: json["house"],
    apartament: json["apartament"],
  );

  Map<String, dynamic> toJson() => {
    "street": street,
    "house": house,
    "apartament": apartament,
  };
}
