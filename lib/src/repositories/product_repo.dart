import 'package:maxkgapp/src/helpers/prefs.dart';

import '../models/favorite.dart';
import '../models/product.dart';

import 'base_repo.dart';

final product = Product(
    id: 4,
    name: 'Ноутбук Acer Extensa 15 EX215-31-C3FF Intel Celeron N4020',
    price: 36940,
    stars: 4,
    discountPercent: 5,
    postId: 22775,
    image: 'tov_353631_bddbd724.JPG');

class ProductRepo extends BaseRepo {
  List<Product> _productList = [
    Product(
        id: 1,
        name: 'Ноутбук Acer Extensa 15 EX215-31-C3FF Intel Celeron N4020',
        price: 36940,
        stars: 4,
        discountPercent: 3,
        postId: 22775,
        image: 'tov_353631_bddbd724.JPG'),
    Product(
        id: 2,
        name: 'Ноутбук Acer Extensa 15 EX215-31-C3FF Intel Celeron N4020',
        price: 36940,
        stars: 2.5,
        postId: 22775,
        image: 'tov_353631_bddbd724.JPG'),
    Product(
        id: 3,
        name: 'Ноутбук Acer Extensa 15 EX215-31-C3FF Intel Celeron N4020',
        price: 36940,
        stars: 4,
        discountPercent: 10,
        postId: 22775,
        image: 'tov_353631_bddbd724.JPG'),
    Product(
        id: 4,
        name: 'Ноутбук Acer Extensa 15 EX215-31-C3FF Intel Celeron N4020',
        price: 36940,
        stars: 4,
        postId: 22775,
        image: 'tov_353631_bddbd724.JPG')
  ];

  final _favoriteList = [];

  getViewedProductList({pageSize = 4}) async {
    final _args = Map<String, dynamic>();
    if (pageSize != null) _args['pageSize'] = pageSize;
    final response = await get(getUrlWithArguments('naltovarok/interest', args: _args),
        decoder: (data) => Product.fromList(data['model']));
    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  getBestsellerProductList({pageSize = 4}) async {
    final _args = Map<String, dynamic>();
    if (pageSize != null) _args['pageSize'] = pageSize;
    final response = await get(getUrlWithArguments('naltovarok/interest', args: _args),
        decoder: (data) => Product.fromList(data['model']));
    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  getDiscountProductList() async {
    final response = await get('discount/product',
        decoder: (list) => Product.fromList(list));
    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  getSimilarProductList(int id, {pageSize = 4}) async {
    final _args = Map<String, dynamic>();
    if (pageSize != null) _args['pageSize'] = pageSize;
    final response = await get(getUrlWithArguments('naltovarok/interest', args: _args),
        decoder: (data) => Product.fromList(data['model']));
    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  getProductListByCategory(int id) async {
    final response = await get('catalog/$id', decoder: (result) {
     print(result);
      var list = (result['model'] as List).map((e) => Product.fromMap(e)).toList();
      if (result['model2']['items'] != null)
        list += (result['model2']['items'] as List).map((e) => Product.fromMap2(e)).toList();

      return list;
    });


    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  getFavoriteProductList({int? pageSize, int? page}) async {
    final _args = Map<String, dynamic>();
    if (pageSize != null) _args['pageSize'] = pageSize;
    if (page != null) _args['page'] = page;
    final response = await get(getUrlWithArguments('naltovarok/interest', args: _args), decoder: (data) {
      return (data['model'] as List).map((map) =>
          Favorite(product: Product.fromMap(map)));
    });
    if (response.isOk) {
      return response.body;
    }

    return _favoriteList;
  }

  getTrendProductList({pageSize = 4}) async {
    final _args = Map<String, dynamic>();
    if (pageSize != null) _args['pageSize'] = pageSize;
    final response = await get(getUrlWithArguments('naltovarok/interest', args: _args),
        decoder: (data) => Product.fromList(data['model']));
    if (response.isOk) {
      return response.body;
    }

    return _productList;
  }

  search(String text) async {
    await Future.delayed(Duration(seconds: 3));

    return _productList
        .where((product) =>
            product.name!.toLowerCase().contains(text.toLowerCase()))
        .toList();
  }
}
