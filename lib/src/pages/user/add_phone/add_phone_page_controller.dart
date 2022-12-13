import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/pages/auth/auth_page/auth_page_controller.dart';

import '../../../models/phone.dart';

class AddPhonePageController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final controller = Get.put(AuthPageController());
  late TextEditingController phoneController;
  RxString phoneNum = "".obs;
  RxBool isTelegram = false.obs;
  RxBool isWhatsUp = false.obs;

  var phoneList = <Phone>[].obs;

  String lastName = "";
  late TextEditingController lastNameController;

  String? validateLastName(String value) {
    if (value.length < 3) {
      return "Фамилия должна быть длинее 3 символов";
    }
    return null;
  }

  Future<void> saveInListPhones() async {
    final box = GetStorage();

    var addressEnterAsMap =
        phoneList.map((phoneList) => phoneList.toJson()).toList();
    String jsonString = jsonEncode(addressEnterAsMap);
    await box.write('phoneEnter', jsonString);
  }

  Future<void> fetchListPhones() async {
    final box = GetStorage();

    if (box.read("phoneEnter") != null) {
      var newPhoneList = <Phone>[];
      print("начал получать");
      final box = GetStorage();
      var result = box.read('phoneEnter');
      List jsonData = jsonDecode(result);
      dynamic getValue =
          jsonData.map((adressList1) => Phone.fromJson(adressList1)).toList();
      print("записанный адрес");


      newPhoneList =
          jsonData.map((payment) => Phone.fromJson(payment)).toList().obs;
      for (int i = 0; i < newPhoneList.length; i++) {
        phoneList.add(newPhoneList[i]);
        print(newPhoneList[i].number);
        print(newPhoneList[i].whatsApp);
      }

      var getvalue = phoneList.map((payment) => payment.toJson()).toList();

    }
  }

  String? validatePhone(String value) {
    if (value.length < 5) {
      return "Телфон должен быть длинее 5 символов";
    }
    return null;
  }

  @override
  void onInit() {
    fetchListPhones();
    phoneController =  MaskedTextController(mask: '000-00-00-000');
    lastNameController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  delatePhone(int value) {
    phoneList.removeAt(value);
    saveInListPhones();
  }

  void checkSave() {
    print("телефон");

    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      print("не валидная");
      return;
    }

    phoneList.add(Phone(
        whatsApp: isWhatsUp.value,
        telegram: isTelegram.value,
        number: controller.selectedCountryPhone.value + "-"  + phoneNum.value));

    saveInListPhones();

    loginFormKey.currentState!.save();
    // Get.back();
  }
}
