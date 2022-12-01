import 'package:html/parser.dart';

import '../const/const.dart';
import '../helpers/helper.dart';
import '../helpers/prefs.dart';
import 'catalog.dart';
import 'app_model.dart';

class Product extends AppModel {
  final String table = Const.CART_PRODUCTS_TABLE;

  late int id;
  String? name;
  late double price;
  double? discountPercent;
  late double stars;
  int? code;
  String? image;
  List<String>? images;
  int? catalogId;
  String? currencySign;
  bool? isNovelty;
  late int balance;
  String? unit;
  String? description;
  String? video;
  String? supplyPeriod;
  int? postId;
  int? productId;
  late bool _inCart;

  late int model;

  double get discountPrice => discountPercent != null ? price - (price / 100 * discountPercent!) : 0;
  String get imageUrl => image!.isNullOrEmpty
      ? 'https://mrsldna.org/wp-content/uploads/2019/03/'
      'product-placeholder.gif'
      : model == 0 ? 'https://max.kg/nal/img/$postId/b_$image' : image!;

  bool get inCart => _inCart;
  set inCart(bool val) => _inCart = val;

  Product({
    this.id = -1,
    this.name,
    this.price = 0,
    this.discountPercent,
    this.stars = 0,
    this.image,
    this.images,
    this.catalogId,
    this.code,
    this.currencySign,
    this.isNovelty,
    this.balance = 0,
    this.unit,
    this.description,
    this.video,
    this.postId,
    this.productId,
    this.model = 0,
  });

  Product.fromMap(Map<String, dynamic> map) {
    id = parseInt(map['id']);
    name = map['naim'] ?? '';
    price = parseDouble('${map['cenaok']}');
    discountPercent = parseDouble('${map['discount_percent']}');
    stars = parseDouble('${map['rating']}', defVal: 0);
    image = map['img'] ?? '';
    // images = map['images'] as List ?? [];
    code = parseInt(map['id_tov']);
    catalogId = parseInt(map['id_cat']);
    isNovelty = parseInt(map['is_novelty']) != 0;
    balance = parseInt(map['balance']);
    unit = map['bazedin'];
    description = map['description'] ?? '';
    video = map['video'];
    postId = parseInt(map['id_post']);
    currencySign = map['currencySign'];
    productId = parseInt(map['id_tov']);
    model = 0;
  }

  Product.fromMap2(Map<String, dynamic> map) {
    id = parseInt(map[id]);
    name = map['name'];
    price = parseDouble('${map['price']}', defVal: 0);
    currencySign = map['currencySign'];
    isNovelty = parseInt(map['isNovelty']) != 0;
    image = map['photoUrl'];
    balance = parseInt(map['balance']);
    description = '';
    video = map['video_file_name'];
    productId = parseInt(map['sid']);
    stars = parseDouble('${map['rating']}', defVal: 0);
    unit = map['pluralNameFormat'];
    model = 1;
  }

  static List<Product> fromList(List list) =>
      list.map((e) => Product.fromMap(e)).toList();

  fromMap(map) {
    return Product.fromMap(map);
  }

  @override
  toMap() => {
        'id': id,
        'name': name,
        'image': image,
        'price': price,
        'discount_price': discountPrice,
        'code': code,
        'rating': stars,
      };

  double getCurrentPrice() => discountPrice != 0 ? discountPrice : price;

  String getCurrentPriceWithCurrency({String? currency}) {
    return _withCurrency(discountPrice != 0 ? discountPrice : price,
        currency: currency ?? currencySign);
  }

  String getPriceWithCurrency({String? currency}) {
    return _withCurrency(price, currency: currency ?? currencySign);
  }

  String _withCurrency(price, {String? currency}) {
    return '${Helper.numberWithSpaces(price.toInt())}  ${currency.isNullOrEmpty ?
            Prefs.defaultCurrency : currency}';
  }
}
