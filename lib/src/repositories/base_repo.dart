import 'dart:io';

import 'package:get/get.dart';

import '../helpers/prefs.dart';
import '../const/const.dart';
import '../helpers/db_helper.dart';

class BaseRepo extends GetConnect {
  final db = DBHelper();

  @override
  void onInit() {
    httpClient.baseUrl = Const.API_BASE_URL;
    httpClient.addRequestModifier((dynamic request) {
      if (Prefs.isLogin) {
        print('accessToken ${Prefs.token.access}');
        request.headers[HttpHeaders.authorizationHeader] = 'Bearer ${Prefs.token.access}';
      }

      return request..headers[HttpHeaders.acceptHeader] = 'application/json';
    });
    httpClient.maxAuthRetries = 3;
    super.onInit();
  }

  String getUrlWithArguments(String url, {Map<String, dynamic> args = const {}}) {
    String sep = '?';
    args.forEach((key, value) {
      if (value != null) {
        url += '$sep$key=$value';
        sep = '&';
      }
    });
    return url;
  }
}
