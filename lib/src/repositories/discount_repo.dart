import 'package:maxkgapp/src/models/product.dart';

import '../models/discount.dart';

import 'base_repo.dart';

class DiscountRepo extends BaseRepo {
  getDiscountList({int? limit}) async {
    String url = 'discount';
    if (limit != null)
      url += '?pageSize=$limit';

    return await get(url, decoder: (data) => Discount.fromList(data));
  }

  getDiscount(int id) async {
    return await get('discount/$id', decoder: (data) {
      final discount = Discount.fromMap(data['promotion']);
      discount.products = data['product'][0] != null ? Product.fromList(data['product'][0]) : null;

      return discount;
    });
  }
}
