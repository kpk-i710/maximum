// To parse this JSON data, do
//
//     final newsList = newsListFromJson(jsonString);

import 'dart:convert';

NewsList newsListFromJson(String str) => NewsList.fromJson(json.decode(str));

String newsListToJson(NewsList data) => json.encode(data.toJson());

class NewsList {
  NewsList({
  required  this.result ,
    required  this.news,
  });

  List<List<List<Result>>> result;
  News news;

  factory NewsList.fromJson(Map<String, dynamic> json) => NewsList(
    result: List<List<List<Result>>>.from(json["result"].map((x) => List<List<Result>>.from(x.map((x) => List<Result>.from(x.map((x) => Result.fromJson(x))))))),
    news: News.fromJson(json["news"]),
  );

  Map<String, dynamic> toJson() => {
    "result": List<dynamic>.from(result.map((x) => List<dynamic>.from(x.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))))),
    "news": news.toJson(),
  };
}

class News {
  News({
  required  this.id,
  required  this.naim,
  required  this.anons,
  required  this.text,
  required  this.moder,
  required  this.dat1,
  required  this.idCat,
  required  this.view,
  required  this.logo,
  });

  String id;
  String naim;
  String anons;
  String text;
  String moder;
  DateTime dat1;
  String idCat;
  String view;
  String logo;

  factory News.fromJson(Map<String, dynamic> json) => News(
    id: json["id"],
    naim: json["naim"],
    anons: json["anons"],
    text: json["text"],
    moder: json["moder"],
    dat1: DateTime.parse(json["dat1"]),
    idCat: json["id_cat"],
    view: json["view"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "naim": naim,
    "anons": anons,
    "text": text,
    "moder": moder,
    "dat1": dat1.toIso8601String(),
    "id_cat": idCat,
    "view": view,
    "logo": logo,
  };
}

class Result {
  Result({
 required this.id,
 required this.art,
 required this.cena0,
 required this.cena4,
 required this.cenaDos,
 required this.cenaok,
 required this.cena0R,
 required this.cena4R,
 required this.cenaDosr,
 required this.cenaKyrs,
 required this.naim,
 required this.url,
 required this.prim,
 required this.img,
 required this.idt,
 required this.notfound,
 required this.idCity,
 required this.dat1,
 required this.minQty,
 required this.isNovelty,
 required this.countryId,
 required this.country,
 required this.stuff,
 required this.size,
 required this.keepPackage,
 required this.isPaidDelivery,
 required this.discountPercent,
   this.currencySign,
 required this.supplyPeriod,
 required this.balance,
 required this.idPost,
 required this.idCat,
 required this.bazedin,
 required this.idCat1C,
 required this.naimCat1C,
 required this.idIdcat,
 required this.moder,
 required this.idTov,
 required this.copy,
 required this.weight,
 required this.description,
 required this.shortDescription,
 required this.trademark,
 required this.cert,
 required this.pli,
 required this.naimWord,
 required this.img1Sm,
 required this.img2Big,
 required this.artPost,
 required this.idUserAdd,
 required this.priceCost,
 required this.priceUpdate,
 required this.naimAdd,
 required this.naimAddManual,
 required this.idUserAddManual,
 required this.idStatus,
 required this.video,
   this.pliUpdate,
  this.metaTitle,
  this.metaDescription,
  this.metaKeywords,
  this.applyTestPer,
  this.discount,
  this.discountPrc,
  this.promotions,
  this.oldPrice,
  this.toDate,
  this.fromDate,
   this.valuteVal,
 required this.price,
  });

  String? id;
  String? art;
  dynamic? cena0;
  dynamic? cena4;
  String? cenaDos;
  int? cenaok;
  dynamic? cena0R;
  dynamic?cena4R;
  dynamic?cenaDosr;
  dynamic?cenaKyrs;
  String? naim;
  String? url;
  dynamic? prim;
  String? img;
  dynamic? idt;
  String? notfound;
  String? idCity;
  dynamic? dat1;
  String? minQty;
  String? isNovelty;
  dynamic? countryId;
  String? country;
  String? stuff;
  String? size;
  dynamic? keepPackage;
  dynamic? isPaidDelivery;
  dynamic? discountPercent;
  CurrencySign? currencySign;
  dynamic? supplyPeriod;
  String? balance;
  String? idPost;
  String? idCat;
  Bazedin? bazedin;
  dynamic? idCat1C;
  dynamic? naimCat1C;
  dynamic? idIdcat;
  String? moder;
  dynamic? idTov;
  dynamic? copy;
  dynamic? weight;
  String? description;
  String? shortDescription;
  String? trademark;
  String? cert;
  String? pli;
  dynamic? naimWord;
  String? img1Sm;
  String? img2Big;
  String? artPost;
  dynamic? idUserAdd;
  String? priceCost;
  String? priceUpdate;
  dynamic? naimAdd;
  dynamic? naimAddManual;
  dynamic? idUserAddManual;
  dynamic? idStatus;
  dynamic? video;
  dynamic? pliUpdate;
  dynamic? metaTitle;
  dynamic? metaDescription;
  dynamic? metaKeywords;
  dynamic? applyTestPer;
  dynamic? discount;
  dynamic? discountPrc;
  List<dynamic>? promotions;
  dynamic? oldPrice;
  dynamic? toDate;
  dynamic? fromDate;
  dynamic? valuteVal;
  int? price ;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    art: json["art"],
    cena0: json["cena0"],
    cena4: json["cena4"],
    cenaDos: json["cena_dos"],
    cenaok: json["cenaok"],
    cena0R: json["cena0r"],
    cena4R: json["cena4r"],
    cenaDosr: json["cena_dosr"],
    cenaKyrs: json["cena_kyrs"],
    naim: json["naim"],
    url: json["url"],
    prim: json["prim"],
    img: json["img"],
    idt: json["idt"] == null ? null : json["idt"],
    notfound: json["notfound"],
    idCity: json["id_city"],
    dat1: json["dat1"],
    minQty: json["minQty"],
    isNovelty: json["isNovelty"],
    countryId: json["country_id"],
    country: json["country"],
    stuff: json["stuff"],
    size: json["size"],
    keepPackage: json["keep_package"],
    isPaidDelivery: json["is_paid_delivery"],
    discountPercent: json["discountPercent"],
    currencySign: currencySignValues.map[json["currencySign"]],
    supplyPeriod: json["supply_period"],
    balance: json["balance"],
    idPost: json["id_post"],
    idCat: json["id_cat"],
    bazedin: bazedinValues.map[json["bazedin"]],
    idCat1C: json["id_cat1c"],
    naimCat1C: json["naim_cat1c"],
    idIdcat: json["id_idcat"],
    moder: json["moder"],
    idTov: json["id_tov"],
    copy: json["copy"],
    weight: json["weight"],
    description: json["description"],
    shortDescription: json["short_description"],
    trademark: json["trademark"],
    cert: json["cert"],
    pli: json["pli"],
    naimWord: json["naim_word"] == null ? null : json["naim_word"],
    img1Sm: json["img1sm"],
    img2Big: json["img2big"],
    artPost: json["art_post"],
    idUserAdd: json["id_user_add"] == null ? null : json["id_user_add"],
    priceCost: json["price_cost"],
    priceUpdate: json["price_update"],
    naimAdd: json["naim_add"],
    naimAddManual: json["naim_add_manual"] == null ? null : json["naim_add_manual"],
    idUserAddManual: json["id_user_add_manual"] == null ? null : json["id_user_add_manual"],
    idStatus: json["id_status"],
    video: json["video"] == null ? null : json["video"],
    pliUpdate: json["pli_update"] ,
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    applyTestPer: json["apply_test_per"] == null ? null : json["apply_test_per"],
    discount: json["discount"],
    discountPrc: json["discount_prc"],
    promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
    oldPrice: json["old_price"],
    toDate: json["to_date"],
    fromDate: json["from_date"],
    valuteVal: valuteValValues.map[json["valuteVal"]],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "art": art,
    "cena0": cena0,
    "cena4": cena4,
    "cena_dos": cenaDos,
    "cenaok": cenaok,
    "cena0r": cena0R,
    "cena4r": cena4R,
    "cena_dosr": cenaDosr,
    "cena_kyrs": cenaKyrs,
    "naim": naim,
    "url": url,
    "prim": prim,
    "img": img,
    "idt": idt == null ? null : idt,
    "notfound": notfound,
    "id_city": idCity,
    "dat1": dat1,
    "minQty": minQty,
    "isNovelty": isNovelty,
    "country_id": countryId,
    "country": country,
    "stuff": stuff,
    "size": size,
    "keep_package": keepPackage,
    "is_paid_delivery": isPaidDelivery,
    "discountPercent": discountPercent,
    "currencySign": currencySignValues.reverse[currencySign],
    "supply_period": supplyPeriod,
    "balance": balance,
    "id_post": idPost,
    "id_cat": idCat,
    "bazedin": bazedinValues.reverse[bazedin],
    "id_cat1c": idCat1C,
    "naim_cat1c": naimCat1C,
    "id_idcat": idIdcat,
    "moder": moder,
    "id_tov": idTov,
    "copy": copy,
    "weight": weight,
    "description": description,
    "short_description": shortDescription,
    "trademark": trademark,
    "cert": cert,
    "pli": pli,
    "naim_word": naimWord == null ? null : naimWord,
    "img1sm": img1Sm,
    "img2big": img2Big,
    "art_post": artPost,
    "id_user_add": idUserAdd == null ? null : idUserAdd,
    "price_cost": priceCost,
    "price_update": priceUpdate,
    "naim_add": naimAdd,
    "naim_add_manual": naimAddManual == null ? null : naimAddManual,
    "id_user_add_manual": idUserAddManual == null ? null : idUserAddManual,
    "id_status": idStatus,
    "video": video == null ? null : video,
    "pli_update": metaKeywords,
    // "pli_update": "${pliUpdate !.year.toString().padLeft(4, '0')}-${pliUpdate!.month.toString().padLeft(2, '0')}-${pliUpdate!.day.toString().padLeft(2, '0')}",
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "apply_test_per": applyTestPer == null ? null : applyTestPer,
    "discount": discount,
    "discount_prc": discountPrc,
    "promotions": List<dynamic>.from(promotions!.map((x) => x)),
    "old_price": oldPrice,
    "to_date": toDate,
    "from_date": fromDate,
    "valuteVal": valuteValValues.reverse[valuteVal],
    "price": price,
  };
}

enum Bazedin { EMPTY }

final bazedinValues = EnumValues({
  "шт": Bazedin.EMPTY
});

enum CurrencySign { EMPTY }

final currencySignValues = EnumValues({
  "с.": CurrencySign.EMPTY
});

enum ValuteVal { KURS_K }

final valuteValValues = EnumValues({
  "kurs_k": ValuteVal.KURS_K
});

class EnumValues<T> {
  late Map<String, T>  map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
