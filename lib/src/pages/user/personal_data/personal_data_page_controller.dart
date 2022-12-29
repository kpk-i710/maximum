import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PersonalDataPageController extends GetxController {
  RxInt selectedGender = 0.obs;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  String name = "";
  String lastName = "";
  late TextEditingController nameController,
      dataBirfController,
      lastNameController;

  Rx<DateTime> dateTime = DateTime.now().obs;

  void showDatePicer({required BuildContext context}) {
    showDatePicker(
            context: context,
            initialDate: DateTime(2000),
            firstDate: DateTime(1950),
            lastDate: DateTime.now())
        .then((value) =>
            dataBirfController.text = DateFormat('dd-MM-yyyy').format(value!));
  }

  String? validateName(String value) {
    if (value.length < 3) {
      return "Имя должно быть длинее 3 символов";
    }
    return null;
  }

  String? validateLastName(String value) {
    if (value.length < 3) {
      return "Фамилия должна быть длинее 3 символов";
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
    nameController = TextEditingController();
    lastNameController = TextEditingController();
    dataBirfController = TextEditingController();
    // TODO: implement onInit
    super.onInit();
  }
}
