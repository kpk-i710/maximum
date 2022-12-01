import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../helpers/prefs.dart';
import '../models/access_token.dart';
import '../models/own_cart.dart';
import '../models/token.dart';
import 'base_repo.dart';

import 'package:http/http.dart' as http;

final String authUrl = "max.kg";

class UserRepo extends BaseRepo {
  var client = http.Client();

  Future<dynamic> postRequest(
      {required String username, required String password}) async {
    username = Helper.replaceAll(username, [' ', '+', '(', ')', '-'], '');
    print("пользовател ввел $username");
    print("пароль ввел $password");
    final response =
        await http.post(Uri.https('max.kg', '/api/v1/site/login'), body: {
      'username': '$username',
      'password': '$password',
    });

    String data = response.body;

    AccessToken? accessToken;

    accessToken = accessTokenFromJson(data);

    if (response.statusCode == 200) {
      print("ответ ${accessToken.accessToken}");
      if ( accessToken.accessToken != null) {
        final _box = GetStorage();
        _box.write("token", accessToken.accessToken);

        Prefs.isLogin = true;
      }
    }
  }

  Future<List<OwnCartModel>?> getRequestGetOwnCart() async {
    final _box = GetStorage();
    String token = _box.read("token");
    print("сейчас токе $token");
    final response =
        await http.get(Uri.https('max.kg', '/api/v1/box'), headers: {
      'Authorization': 'Bearer $token',
    });

    OwnCartModel? ownCartModel;

    List<OwnCartModel> ownCart = await ownCartModelFromJson(response.body);

    if (response.statusCode == 200) {
      return ownCart;
    } else {
      print("нет в корзине");
    }
  }

  Future<Response> logIn(String phone) async => await post(
        'site/logincode',
        {'tel': phone},
      );

  Future<Response<Token>> confirmCode(String phone, String code) async =>
      await post(
        'site/confirmcode',
        {'tel': phone, 'code': code},
        decoder: (response) => Token.fromMap(response),
      );
}
