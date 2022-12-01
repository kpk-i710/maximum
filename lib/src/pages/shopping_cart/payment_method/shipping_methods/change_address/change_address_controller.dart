import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/material.dart';

import '../../../../../models/address_enter.dart';
import '../../../shopping_cart_page_controller.dart';

class ChangeAdressController extends GetxController {
  RxInt selectedRadio = 1.obs;
  final mapObjects = <MapObject>[].obs;
  final controllerShoppingCart = Get.put(ShoppingCartPageController());
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  var streetName = '';
  var houseName = '';
  var apartament = '';
  var addressEnter = <AddressEnter>[].obs;

  Future<void> saveInListAddress() async {
    final box = GetStorage();

    var addressEnterAsMap =
        addressEnter.map((adressList) => adressList.toJson()).toList();
    String jsonString = jsonEncode(addressEnterAsMap);
    await box.write('adressEnter', jsonString);

    // print("адресс сохранил");
    // print(box.read('adressEnter'));
  }

  Future<void> fetchListAdress() async {
    final box = GetStorage();

    if (box.read("adressEnter") != null) {
      var newAdressEnter = <AddressEnter>[];
      print("начал получать");
      final box = GetStorage();
      var result = box.read('adressEnter');
      List jsonData = jsonDecode(result);
      dynamic getValue = jsonData
          .map((adressList1) => AddressEnter.fromJson(adressList1))
          .toList();
      print("записанный адрес");
      newAdressEnter = jsonData
          .map((payment) => AddressEnter.fromJson(payment))
          .toList()
          .obs;
      for (int i = 0; i < newAdressEnter.length; i++) {
        addressEnter.add(newAdressEnter[i]);
      }

      var getvalue = addressEnter.map((payment) => payment.toJson()).toList();
      // print(getvalue);
    }
  }

  Future<void> intfetchListAdress() async {
    final box = GetStorage();
    if (box.read("adressEnter") != null) {
      var newAdressEnter = <AddressEnter>[];
      print("начал получать");
      final box = GetStorage();
      var result = box.read('adressEnter');
      List jsonData = jsonDecode(result);
      dynamic getValue = jsonData
          .map((adressList1) => AddressEnter.fromJson(adressList1))
          .toList();
      print("записанный адрес");
      newAdressEnter = jsonData
          .map((payment) => AddressEnter.fromJson(payment))
          .toList()
          .obs;

      houseController.text = newAdressEnter[newAdressEnter.length - 1].house;
      streetController.text = newAdressEnter[newAdressEnter.length - 1].street;
    }
  }

  late TextEditingController streetController, houseController;

  String? validateStritName(String value) {
    if (value.length < 3) {
      return "Название улицы должно быть дилнее 3 символов";
    }
    return null;
  }

  String? validateHouseName(String value) {
    if (value.length < 1) {
      return "Поле не заполнено";
    }
    return null;
  }

  bool checkAdress() {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    Get.back();
    loginFormKey.currentState!.save();

    addressEnter.add(AddressEnter(
        street: streetName, house: houseName, apartament: apartament));
    controllerShoppingCart.selectedStreetHouse.value =
        "$streetName $houseName $apartament";
    saveInListAddress();
    return true;
  }

  @override
  void onInit() {
    fetchListAdress();

    streetController = TextEditingController();
    houseController = TextEditingController();
    intfetchListAdress();

    super.onInit();
  }
}
