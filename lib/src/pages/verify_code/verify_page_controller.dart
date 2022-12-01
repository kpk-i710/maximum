import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';

import '../../repositories/user_repo.dart';
import '../../helpers/app_router.dart';
import '../../helpers/prefs.dart';

class VerifyPageController extends GetxController {
  final _userRepo = Get.find<UserRepo>();

  var _phone = '';
  var _code = '';
  var _loading = false;
  var _termsAgree = false;

  get phone => _phone;
  get isLoading => _loading;
  get termsAgreed => _termsAgree;
  set termsAgreed(newVal) {
    _termsAgree = newVal;
    update();
  }

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();

  void onInit() {
    _phone = Get.arguments as String;
    super.onInit();
  }

  verify(String code) async {
    if (_termsAgree) {
      _loading = true;
      update();

      _phone = Helper.replaceAll(_phone, [' ', '+', '(', ')','-'], '');
      final response = await _userRepo.confirmCode(_phone, code);

      _loading = false;
      update();

      if (response.isOk) {
        Prefs.isLogin = true;
        Prefs.token = response.body!;

        Get.offAllNamed(AppRouter.profileParams);
        return;
      }

      Get.snackbar('Не удалось войти', response.bodyString ?? '');
    } else {
      Get.showSnackbar(GetBar(message: 'you_must_agree_to_the_terms'.tr));
    }
  }

  checkCode() {
    if (_code.length == 4) {
      verify(_code);
    }
  }

  inputCode(String value) {
    if (value.length == 1) {
      _code += value;
      switch (_code.length) {
        case 1:
          FocusScope.of(Get.context!).requestFocus(focusNode2);
          break;
        case 2:
          FocusScope.of(Get.context!).requestFocus(focusNode3);
          break;
        case 3:
          FocusScope.of(Get.context!).requestFocus(focusNode4);
          break;
        case 4:
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          verify(_code);
          break;
        default:
          FocusScope.of(Get.context!).requestFocus(FocusNode());
          break;
      }
    }
  }
}
