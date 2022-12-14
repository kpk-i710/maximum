import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'dart:convert';

import '../../../models/address_enter.dart';
import 'shipping_methods/shipping_methods_controller.dart';import '../../../widgets/widgets.dart' as widgets;

enum DeliveryOrPayment { DELIVERY, PAYMENT }

class BeforPaymentDevliryController extends GetxController {
  RxBool status = false.obs;
  RxBool isSelectedDelivryPayMethod = false.obs;
  RxBool isSelectedDelivryFreeMethod = false.obs;
  RxBool isSelectedPaymentMethod = false.obs;
  final controllerShippingMethods = Get.put(ShippingMethodsController());

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  late TextEditingController firstNameController,
      lastNameController,
      numberPhoneController,
      nameCompanyController,
      innCompayController;

  var firstName = '';
  var lastName = '';
  var numberPhone = " ";

  var nameCompany = '';
  var innCompay = '';

  @override
  void onInit() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    numberPhoneController = MaskedTextController(mask: '000-00-00-000');
    nameCompanyController = TextEditingController();
    innCompayController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }

  String? validateFirstName(String value) {
    if (value.length < 3) {
      return "Имя должно быть длинее 3 символов";
    }
    return null;
  }

  String? validateNumberPhone(String value) {
    if (value.length < 3) {
      return "Телефон должен быть длинее 3 символов";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 3) {
      return "Фамилия должна быть длинее 3 символов";
    }
    return null;
  }

  String? validateCompanyName(String value) {
    if (value.length < 3) {
      return "Название компании должно быть длинее 3 символов";
    }
    return null;
  }

  String? validateInnCompay(String value) {
    if (value.length != 14) {
      return "ИНН компании 14 символов";
    }
    return null;
  }

  bool checkLogin() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    loginFormKey.currentState!.save();
return true;

    print("зашел");
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    numberPhoneController.dispose();
    innCompayController.dispose();
    nameCompanyController.dispose();

    super.onClose();
  }

  bool currentStatusButton(DeliveryOrPayment select) {
    if (select == DeliveryOrPayment.DELIVERY) {
      return controllerShippingMethods.selectedPage.value == 1
          ? isSelectedDelivryPayMethod.value
          : isSelectedDelivryFreeMethod.value;
    } else
      return isSelectedPaymentMethod.value;
  }

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;
}
