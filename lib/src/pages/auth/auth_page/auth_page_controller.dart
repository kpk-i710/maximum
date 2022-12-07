import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/repositories/user_repo.dart';

import '../../../helpers/app_router.dart';
import '../../../helpers/prefs.dart';
import '../../../models/country_code.dart';
import '../../user/profile/profile_page.dart';

class AuthPageController extends GetxController {
  final phoneCont = MaskedTextController(mask: '000-00-00-00');
  late TextEditingController passwordController;
  var phoneWithOutCodeCountry = "";


  RxString selectedCountryPhone = "+996".obs;

  List<CountryCode> dropList =  [
    CountryCode(number: '+996', iconSVg: 'kyrgyzstan'),
    CountryCode(number: '+7', iconSVg: 'russia'),

  ];

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  String password = '';
  var phoneNumber = "";

  RxBool passwordVisible = false.obs;

  @override
  void onInit() {


    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    passwordController.dispose();
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
  }
}
