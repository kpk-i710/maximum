import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter/material.dart';

import '../../../../../helpers/prefs.dart';
import '../../../../../models/address_enter.dart';
import '../../../shopping_cart_page_controller.dart';
import '../../payment_method_controller.dart';

class ChangeAdressController extends GetxController {
  final controllerPaymentMethod = Get.put(PaymentMethodController());

  final controllerCart = Get.put(ShoppingCartPageController());
  RxInt selectedRadio = 10.obs;
  RxBool isFirstPage = false.obs;
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
  }

  change(int? value) {
    selectedRadio.value = value!;
  }

  delateAdress(int value) {
    addressEnter.removeAt(value);
    if (addressEnter.length < 1) {
      controllerPaymentMethod.isSelectedDelivryPayMethod.value = false;
    }
    // print(   addressEnter.map((payment) => payment.toJson()).toList() );
    saveInListAddress();
  }

  bool isCourier(List<String>? list) {
    print("длина");
    print(addressEnter.length);
    if (list != null) {
      return false;
    }
    return true;
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
        "ул. " + streetName + " д." + houseName + " кв." + apartament;
    saveInListAddress();

    // "$streetName $houseName $apartament";
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
