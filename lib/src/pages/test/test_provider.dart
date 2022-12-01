import 'package:get/get.dart';

class TestProvider extends GetConnect {
  String token =
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEzMzgyNjY0LCJqdGkiOiI1MzJkNjk0MGY4Nzg0NjhhOWFlNjg0ZmI5MDJhOWQ4OSIsInVzZXJfaWQiOjV9.2dgSP4vTep5wy5TZ8y6xKtiGuwlGHkK0yxgYoNHaZVM";

  addProduct(map, Function(Response res, int code) callBack) async {
    final form = FormData(map);

    Response resp = await post(
        'http://recipeforyouapi.herokuapp.com/ru/no_violence/file/create/',
        form,
        headers: {'Authorization': token});
    if (callBack != null) callBack(resp, 1);
  }
}
