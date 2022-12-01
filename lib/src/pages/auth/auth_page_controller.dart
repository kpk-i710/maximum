import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/repositories/user_repo.dart';

import '../../helpers/app_router.dart';
import '../../helpers/prefs.dart';
import '../user/profile/profile_page.dart';

class AuthPageController extends GetxController {
  var _loading = false;
  var _countryCode = '+ (996)';
  final phoneCont = MaskedTextController(mask: '000-00-00-00');
  late TextEditingController passwordController;
  var phoneWithOutCodeCountry = "";

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var _userRepo = Get.find<UserRepo>();
  var password = '';

  get isLoading => _loading;

  get countryCode => _countryCode;

  set countryCode(newVal) {
    _countryCode = newVal;
    update();
  }

  @override
  void onInit() {
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
  }

  auth(String phone) async {
    bool returnVal = false;

    _loading = true;
    update();

    phone = Helper.replaceAll(phone, [' ', '+', '(', ')', '-'], '');
    print("номер ввели $phone");
    final response = await _userRepo.logIn(phone);
    print(response.bodyString);
    if (response.isOk) {
      returnVal = true;
    }

    _loading = false;
    update();

    return returnVal;
  }

  String? validatePhone(String value) {
    if (value.length < 1) {
      return "Введите номер телефона";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 1) {
      return "Введите пароль";
    }
    return null;
  }

  void checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }

    loginFormKey.currentState!.save();

    var phone = countryCode + phoneCont.text;

    _userRepo.postRequest(username: phone, password: password).then((value) => {
          if (Prefs.isLogin)
            Get.off(ProfilePage())
          else
            {
              Get.snackbar(
                "Пользователь не найден",
                "Не удалось найти пользователя",
                duration: Duration(milliseconds: 700),
                icon: Icon(Icons.person, color: Colors.white),
                snackPosition: SnackPosition.TOP,
              )
            }
        });
  }
}
