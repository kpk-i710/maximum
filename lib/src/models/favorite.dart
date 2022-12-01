import 'app_model.dart';
import 'product.dart';

class Favorite extends AppModel {
  late Product product;
  int? usersCount;

  Favorite({this.usersCount = 0, required this.product});

  Favorite.fromMap(Map<String, dynamic> map) {}

  fromMap(map) {
    return Favorite.fromMap(map);
  }

  toMap() {
    return {};
  }
}
