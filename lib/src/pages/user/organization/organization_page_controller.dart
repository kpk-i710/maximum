import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../auth/auth_page/auth_page_controller.dart';

class OrganizationPageController extends GetxController {

  final controller = Get.put(AuthPageController());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String fullNameOrganiz = "";
  String inn = "";
  String address = "";
  String bank = "";
  String payment = "";
  String bik = "";
  String email = "";

  RxString selectedTypeOrganiz = "ИП".obs;

  List<String> organizTypeList = ["ИП", "ОсОО", "Патент", "Другое"];

  late TextEditingController fullNameOrganizController,
      innController,
      addressController,
      bankController,
      paymentController,
      bikController,
      emailController;

  String? validateFullNameOrganiz(String value) {
    if (value.length < 3) {
      return "Полное имя ораганизации должно быть длинее 3 символов";
    }
    return null;
  }

  String? validateInn(String value) {
    if (value.length < 14) {
      return "ИНН должен быть 14 символов";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.length < 3) {
      return "Адресс должен быть длинее 3 символов";
    }
    return null;
  }
  String? validateBank (String value) {
    if (value.length < 3) {
      return "Банк должен быть длинее 3 символов";
    }
    return null;
  }


  String? validatePayment  (String value) {
    if (value.length < 3) {
      return "Расчетный счет должен быть длинее 3 символов";
    }
    return null;
  }
  String? validateBik  (String value) {
    if (value.length < 3) {
      return "БИК должен быть длинее 3 символов";
    }
    return null;
  }

  String? validateEmail  (String value) {
    if (value.length < 3) {
      return "Email должен быть длинее 3 символов";
    }
    return null;
  }


  void checkSave() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    Get.back();
  }

  @override
  void onInit() {
    fullNameOrganizController = TextEditingController();
    innController = TextEditingController();
    addressController = TextEditingController();
    bankController = TextEditingController();
    paymentController = TextEditingController();
    bikController = TextEditingController();
    emailController = TextEditingController();

    // TODO: implement onInit
    super.onInit();
  }
}
