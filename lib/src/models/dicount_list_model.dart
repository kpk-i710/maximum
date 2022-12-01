// To parse this JSON data, do
//
//     final discountListDetaile = discountListDetaileFromJson(jsonString);

import 'dart:convert';

DiscountListDetaile discountListDetaileFromJson(String str) => DiscountListDetaile.fromJson(json.decode(str));

String discountListDetaileToJson(DiscountListDetaile data) => json.encode(data.toJson());

class DiscountListDetaile {
  DiscountListDetaile({
    required this.product,
  required this.page,
  required this.count,
  required this.id,
  required this.promotion,
  });

  List<List<Product>> product;
  int page;
  String count;
  String id;
  Promotion promotion;

  factory DiscountListDetaile.fromJson(Map<String, dynamic> json) => DiscountListDetaile(
    product: List<List<Product>>.from(json["product"].map((x) => List<Product>.from(x.map((x) => Product.fromJson(x))))),
    page: json["page"],
    count: json["count"],
    id: json["id"],
    promotion: Promotion.fromJson(json["promotion"]),
  );

  Map<String, dynamic> toJson() => {
    "product": List<dynamic>.from(product.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "page": page,
    "count": count,
    "id": id,
    "promotion": promotion.toJson(),
  };
}

class Product {
  Product({
    required this.id,
     this.art,
     this.cena0,
     this.cena4,
     this.cenaDos,
     this.cenaok,
     this.cena0R,
     this.cena4R,
     this.cenaDosr,
     this.cenaKyrs,
     this.naim,
     this.url,
     this.prim,
     this.img,
     this.idt,
     this.notfound,
     this.idCity,
     this.dat1,
     this.minQty,
     this.isNovelty,
     this.countryId,
     this.country,
     this.stuff,
     this.size,
     this.keepPackage,
     this.isPaidDelivery,
     this.discountPercent,
     this.currencySign,
     this.supplyPeriod,
     this.balance,
     this.idPost,
     this.idCat,
     this.bazedin,
     this.idCat1C,
     this.naimCat1C,
     this.idIdcat,
     this.moder,
     this.idTov,
     this.copy,
     this.weight,
     this.description,
     this.shortDescription,
     this.trademark,
     this.cert,
     this.pli,
     this.naimWord,
     this.img1Sm,
     this.img2Big,
     this.artPost,
     this.idUserAdd,
     this.priceCost,
     this.priceUpdate,
     this.naimAdd,
     this.naimAddManual,
     this.idUserAddManual,
     this.idStatus,
     this.video,
     this.pliUpdate,
     this.metaTitle,
     this.metaDescription,
     this.metaKeywords,
     this.discount,
     this.discountPrc,
     this.promotions,
     this.oldPrice,
     this.toDate,
     this.fromDate,
     this.timer,
     this.valuteVal,
     this.price,
  });

  String   id;
  String? art;
  dynamic? cena0;
  dynamic? cena4;
  String? cenaDos;
  int   ?  cenaok;
  dynamic? cena0R;
  dynamic? cena4R;
  dynamic? cenaDosr;
  dynamic? cenaKyrs;
  String?naim;
  String?url;
  String?prim;
  String?img;
  dynamic? idt;
  String? notfound;
  String? idCity;
  dynamic? dat1;
  String? minQty;
  String? isNovelty;
  dynamic? countryId;
  String?country;
  String?stuff;
  String?size;
  dynamic?keepPackage;
  dynamic?isPaidDelivery;
  dynamic?discountPercent;
  String ?currencySign;
  dynamic? supplyPeriod;
  String? balance;
  String? idPost;
  String? idCat;
  String? bazedin;
  dynamic? idCat1C;
  dynamic? naimCat1C;
  dynamic? idIdcat;
  String? moder;
  String? idTov;
  dynamic? copy;
  dynamic? weight;
  String?description;
  String?shortDescription;
  String?trademark;
  String?cert;
  String?pli;
  dynamic? naimWord;
  String? img1Sm;
  String? img2Big;
  String? artPost;
  dynamic? idUserAdd;
  String? priceCost;
  String? priceUpdate;
  dynamic? naimAdd;
  String?naimAddManual;
  String?idUserAddManual;
  String?idStatus;
  String?video;
  String ?pliUpdate;
  dynamic? metaTitle;
  dynamic? metaDescription;
  dynamic? metaKeywords;
  dynamic? discount;
  dynamic? discountPrc;
  List<dynamic>? promotions;
  int ?oldPrice;
  DateTime? toDate;
  DateTime ? fromDate;
  String? timer;
  String ?valuteVal;
  int? price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    art: json["art"],
    cena0: json["cena0"]   ,
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
    idt: json["idt"],
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
    currencySign: json["currencySign"],
    supplyPeriod: json["supply_period"],
    balance: json["balance"],
    idPost: json["id_post"],
    idCat: json["id_cat"],
    bazedin: json["bazedin"],
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
    naimWord: json["naim_word"],
    img1Sm: json["img1sm"],
    img2Big: json["img2big"],
    artPost: json["art_post"],
    idUserAdd: json["id_user_add"],
    priceCost: json["price_cost"],
    priceUpdate: json["price_update"],
    naimAdd: json["naim_add"],
    naimAddManual: json["naim_add_manual"],
    idUserAddManual: json["id_user_add_manual"],
    idStatus: json["id_status"],
    video: json["video"],
    pliUpdate: json["pli_update"] ,
    metaTitle: json["meta_title"],
    metaDescription: json["meta_description"],
    metaKeywords: json["meta_keywords"],
    discount: json["discount"],
    discountPrc: json["discount_prc"],
    promotions: List<dynamic>.from(json["promotions"].map((x) => x)),
    oldPrice: json["old_price"],
    toDate: DateTime.parse(json["to_date"]),
    fromDate: DateTime.parse(json["from_date"]),
    timer: json["timer"],
    valuteVal: json["valuteVal"],
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
    "idt": idt,
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
    "currencySign": currencySign,
    "supply_period": supplyPeriod,
    "balance": balance,
    "id_post": idPost,
    "id_cat": idCat,
    "bazedin": bazedin,
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
    "naim_word": naimWord,
    "img1sm": img1Sm,
    "img2big": img2Big,
    "art_post": artPost,
    "id_user_add": idUserAdd,
    "price_cost": priceCost,
    "price_update": priceUpdate,
    "naim_add": naimAdd,
    "naim_add_manual": naimAddManual,
    "id_user_add_manual": idUserAddManual,
    "id_status": idStatus,
    "video": video,
    "pli_update": pliUpdate,
    "meta_title": metaTitle,
    "meta_description": metaDescription,
    "meta_keywords": metaKeywords,
    "discount": discount,
    "discount_prc": discountPrc,
    "promotions": List<dynamic>.from(promotions!.map((x) => x)),
    "old_price": oldPrice,
    "to_date": "${toDate?.year.toString().padLeft(4, '0')}-${toDate?.month.toString().padLeft(2, '0')}-${toDate?.day.toString().padLeft(2, '0')}",
    "from_date": "${fromDate?.year.toString().padLeft(4, '0')}-${fromDate?.month.toString().padLeft(2, '0')}-${fromDate?.day.toString().padLeft(2, '0')}",
    "timer": timer,
    "valuteVal": valuteVal,
    "price": price,
  };
}

class Promotion {
  Promotion({
   required this.promotionId,
   required this.name,
   required this.shortDescription,
   required this.description,
   required this.conditions,
   required this.bonuses,
   required this.toDate,
   required this.fromDate,
   required this.priority,
   required this.stop,
   required this.zone,
   required this.conditionsHash,
   required this.status,
   required this.numberOfUsages,
   required this.usersConditionsHash,
   required this.image,
   required this.banner,
   required this.bannerCat,
   required this.timer,
   required this.timerContinue,
   required this.days,
   required this.hours,
   required this.wordDay,
   required this.word,
   required this.message,
  });

  String promotionId;
  String name;
  String shortDescription;
  String description;
  String conditions;
  Bonuses bonuses;
  String toDate;
  String fromDate;
  String priority;
  String stop;
  String zone;
  dynamic conditionsHash;
  String status;
  String numberOfUsages;
  dynamic usersConditionsHash;
  String image;
  dynamic banner;
  String bannerCat;
  String timer;
  String timerContinue;
  int days;
  int hours;
  String wordDay;
  String word;
  String message;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    promotionId: json["promotion_id"],
    name: json["name"],
    shortDescription: json["short_description"],
    description: json["description"],
    conditions: json["conditions"],
    bonuses: Bonuses.fromJson(json["bonuses"]),
    toDate: json["to_date"],
    fromDate: json["from_date"],
    priority: json["priority"],
    stop: json["stop"],
    zone: json["zone"],
    conditionsHash: json["conditions_hash"],
    status: json["status"],
    numberOfUsages: json["number_of_usages"],
    usersConditionsHash: json["users_conditions_hash"],
    image: json["image"],
    banner: json["banner"],
    bannerCat: json["banner_cat"],
    timer: json["timer"],
    timerContinue: json["timer_continue"],
    days: json["days"],
    hours: json["hours"],
    wordDay: json["word_day"],
    word: json["word"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "promotion_id": promotionId,
    "name": name,
    "short_description": shortDescription,
    "description": description,
    "conditions": conditions,
    "bonuses": bonuses.toJson(),
    "to_date": toDate,
    "from_date": fromDate,
    "priority": priority,
    "stop": stop,
    "zone": zone,
    "conditions_hash": conditionsHash,
    "status": status,
    "number_of_usages": numberOfUsages,
    "users_conditions_hash": usersConditionsHash,
    "image": image,
    "banner": banner,
    "banner_cat": bannerCat,
    "timer": timer,
    "timer_continue": timerContinue,
    "days": days,
    "hours": hours,
    "word_day": wordDay,
    "word": word,
    "message": message,
  };
}

class Bonuses {
  Bonuses({
  required this.the1,
  });

  The1   the1;

  factory Bonuses.fromJson(Map<String, dynamic> json) => Bonuses(
    the1: The1.fromJson(json["1"]),
  );

  Map<String, dynamic> toJson() => {
    "1": the1.toJson(),
  };
}

class The1 {
  The1({
 required this.bonus,
 required this.type,
 required this.discountValue,
    required   this.discountBonuse,
  });

  String bonus;
  String type;
  String discountValue;
  String discountBonuse;

  factory The1.fromJson(Map<String, dynamic> json) => The1(
    bonus: json["bonus"],
    type: json["type"],
    discountValue: json["discount_value"],
    discountBonuse: json["discount_bonuse"],
  );

  Map<String, dynamic> toJson() => {
    "bonus": bonus,
    "type": type,
    "discount_value": discountValue,
    "discount_bonuse": discountBonuse,
  };
}
