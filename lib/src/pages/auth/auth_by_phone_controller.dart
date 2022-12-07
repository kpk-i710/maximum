import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

import '../../helpers/app_router.dart';

class AuthByPhoneController extends GetxController {
  final GlobalKey<FormState> loginFormKey1 = GlobalKey<FormState>();
  final phoneCont = MaskedTextController(mask: '000-00-00-00');
  var phoneNumber = "" ;


  String? validatePhone(String value) {
    print("даные из валидации номер");
    print(value.length);
    if (value.length <10) {
      return "Введите номер телефона";
    }
    return null;
  }
  void checkLogin() {
    final isValid = loginFormKey1.currentState!.validate();
    if (!isValid) {
      return;
    }

    loginFormKey1.currentState!.save();
    Get.toNamed(AppRouter.authEnterCode);
  }

}
