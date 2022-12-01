import '../models/dicount_list_model.dart';
import 'package:http/http.dart' as http;

import '../models/news_list.dart';

class RemoteService {
  Future<DiscountListDetaile?> getProducts(String id) async {
    var client = http.Client();

    var uri = Uri.parse("https://max.kg/api/v1/discount/$id?_format=json");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return discountListDetaileFromJson(json);
    } else {}
  }

  Future<NewsList?> getNews(String id) async {
    var client = http.Client();

    var uri = Uri.parse("https://max.kg/api/v1/news/$id?_format=json");
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;

      return newsListFromJson(json);
    } else {}
  }
}
