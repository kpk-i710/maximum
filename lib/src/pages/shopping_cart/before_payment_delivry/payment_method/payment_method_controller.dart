import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../before_payment_delivry_controller.dart';

class PaymentMethodController extends GetxController {
  RxString selectedCountryPhone = "Бакай".obs;

  final controllerBeforPaymentDeivry = Get.put(BeforPaymentDevliryController());

  List<String> listBanks = [
    'ОАО РСК Банк',
    'Бакай',
    'Дамир',
  ];


  List<String> listPayments = [
    'Наличными в офисе',
    'Банковский перевод',
    'Электронный кашелек Эльсом',
    'Наличными курьеру',
    'Оплата картой VISA',
  ];


  RxInt selectedRadio = 1.obs;

  @override
  void onInit() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controllerBeforPaymentDeivry.isSelectedPaymentMethod.value = true;
    });
    print("началов выбора");
  }

  change({int? value, required String paymentMethod}) {
    selectedRadio.value = value!;
    final box = GetStorage();
    box.write("paymentGlobal", paymentMethod);
  }
}
