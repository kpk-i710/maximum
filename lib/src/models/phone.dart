import 'dart:convert';

Phone phoneFromJson(String str) => Phone.fromJson(json.decode(str));

String phoneToJson(Phone data) => json.encode(data.toJson());

class Phone {
  Phone({
    this.number = "",
    this.whatsApp = false,
    this.telegram = false,
  });

  String number;
  bool whatsApp;
  bool telegram;

  factory Phone.fromJson(Map<String, dynamic> json) => Phone(
        number: json["number"],
        whatsApp: json["whatsApp"],
        telegram: json["telegram"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "whatsApp": whatsApp,
        "telegram": telegram,
      };
}
