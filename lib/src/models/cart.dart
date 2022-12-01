import '../const/const.dart';
import 'product.dart';
import 'app_model.dart';

class Cart extends AppModel {
  final String table = Const.CART_TABLE;

  late int id;
  String? title;
  int? sid;
  double? price;
  late int quantity;
  int? productId;
  int? postId;
  String? url;
  String? image;
  String? date;
  bool checked = false;

  String get imageUrl => 'https://max.kg/nal/img/$postId/b_$image';

  Cart({
    this.id = 0,
    this.title,
    this.sid,
    this.price,
    this.postId,
    this.image,
    this.date,
    this.url,
    this.productId,
    this.quantity = 0,
    this.checked = false,
  });

  Cart.fromMap(Map<String, dynamic> map) {
    id = parseInt(map['id']);
    price = parseDouble(map['cenaok']);
    quantity = parseInt(map['kol']);
    sid = parseInt(map['sid']);
    postId = parseInt(map['id_post']);
    productId = parseInt(map['id_tov']);
    title = map['naim'];
    url = map['url'];
    image = map['img'];
    date = map['dat1'];
  }

  fromMap(map) {
    return Cart.fromMap(map);
  }

  toMap() => {
    'id_tov': productId,
    'kol': quantity,
    'cenaok': price,
    'sid': sid,
    'id_post': postId,
    'id_tv': productId,
    'naim': title,
    'url': url,
    'img': image,
    'dat1': date,
  };

}
