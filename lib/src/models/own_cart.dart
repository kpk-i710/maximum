// To parse this JSON data, do
//
//     final ownCartModel = ownCartModelFromJson(jsonString);

import 'dart:convert';

List<OwnCartModel> ownCartModelFromJson(String str) => List<OwnCartModel>.from(json.decode(str).map((x) => OwnCartModel.fromJson(x)));

String ownCartModelToJson(List<OwnCartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OwnCartModel {
  OwnCartModel({
    this.id,
    this.sid,
    this.cena0,
    this.kol,
    this.cena4,
    this.cenaDos,
    this.cenaok,
    this.cena0R,
    this.cena4R,
    this.cenaDosr,
    this.naim,
    this.url,
    this.prim,
    this.img,
    this.idUser,
    this.dat1,
    this.idt,
    this.idPost,
    this.idTov,
    this.nds,
    this.service,
    this.currencySign,
    this.valuteVal,
    this.price,
  });

  String ? id;
  String?sid;
  String?cena0;
  String?kol;
  dynamic ?cena4;
  String ?cenaDos;
  int?cenaok;
  String?cena0R;
  String?cena4R;
  String?cenaDosr;
  String?naim;
  String?url;
  String?prim;
  String?img;
  String?idUser;
  DateTime? dat1;
  String? idt;
  String? idPost;
  String? idTov;
  dynamic? nds;
  dynamic? service;
  String?currencySign;
  String?valuteVal;
  int? price;

  factory OwnCartModel.fromJson(Map<String, dynamic> json) => OwnCartModel(
    id: json["id"],
    sid: json["sid"],
    cena0: json["cena0"],
    kol: json["kol"],
    cena4: json["cena4"],
    cenaDos: json["cena_dos"],
    cenaok: json["cenaok"],
    cena0R: json["cena0r"],
    cena4R: json["cena4r"],
    cenaDosr: json["cena_dosr"],
    naim: json["naim"],
    url: json["url"],
    prim: json["prim"],
    img: json["img"],
    idUser: json["id_user"],
    dat1: DateTime.parse(json["dat1"]),
    idt: json["idt"],
    idPost: json["id_post"],
    idTov: json["id_tov"],
    nds: json["nds"],
    service: json["service"],
    currencySign: json["currencySign"],
    valuteVal: json["valuteVal"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "sid": sid,
    "cena0": cena0,
    "kol": kol,
    "cena4": cena4,
    "cena_dos": cenaDos,
    "cenaok": cenaok,
    "cena0r": cena0R,
    "cena4r": cena4R,
    "cena_dosr": cenaDosr,
    "naim": naim,
    "url": url,
    "prim": prim,
    "img": img,
    "id_user": idUser,
    "dat1": dat1?.toIso8601String(),
    "idt": idt,
    "id_post": idPost,
    "id_tov": idTov,
    "nds": nds,
    "service": service,
    "currencySign": currencySign,
    "valuteVal": valuteVal,
    "price": price,
  };
}
