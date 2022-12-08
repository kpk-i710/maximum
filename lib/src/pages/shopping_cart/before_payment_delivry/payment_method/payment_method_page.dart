import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/app_icon.dart';
import 'package:maxkgapp/src/widgets/widgets.dart' as widgets;

import '../before_payment_delivry_controller.dart';
import 'payment_method_controller.dart';

class PaymentMethodPage extends StatelessWidget {
  final controller = Get.put(PaymentMethodController());
  final controllerBeforPaymentDeivry = Get.put(BeforPaymentDevliryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.background,
        elevation: 2,
        leading: BackButton(color: context.theme.mainTextColor),
        title: Text(
          'payment_methods1'.tr,
          style: AppTextStyles.roboto(fontSize: 18),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    selectRadio(text: "Наличными в офисе", index: 0, icon: 'cash'),
                    selectRadio(text: "Банковский перевод", index: 1, icon: 'bank_transfer'),
                    selectRadio(text: "Электронный кошелек Эльсом", index: 2, icon: "bank_transfer"),
                    selectRadio(text: "Наличными курьеру", index: 3, icon: "cash"),
                    selectRadio(text: "Оплата картой VISA, Mastercart, Elcart", index: 4, icon: 'visa'),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: widgets.saveButton(
                    text: 'checkout'.tr.toUpperCase(),
                    onPressed: () {
                      Get.back();
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget selectRadio({
    required String text,
    required int index,
    required String icon,
  }) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.change(value: index,paymentMethod: text);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: index == controller.selectedRadio.value
                        ? Color(0xff142A65)
                        : Colors.white,
                    border: Border.all(
                      color: Color(0xffACACAC),
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Radio(
                      activeColor: Colors.white,
                      value: index,
                      groupValue: controller.selectedRadio.value,
                      onChanged: (int? value) {
                        controller.change(value: index,paymentMethod: text);
                      },
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: SizedBox(
                        width: Get.width - 100,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "$text",
                          style: index == controller.selectedRadio.value
                              ? widgets.robotoConsid(color: Colors.white)
                              : widgets.robotoConsid(color: Color(0xff727272)),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    widgets.anySvg(
                        nameSvg: icon,
                        color: controller.selectedRadio.value == index
                            ? Colors.white
                            : null),
                    SizedBox(width: 20)
                  ],
                ),
              ),
            ),
            if (index == controller.selectedRadio.value && index != 1)
              schedule(),
            if (index == controller.selectedRadio.value && index == 1)
              scheduleBank()
          ],
        ),
      );
    });
  }

  Widget schedule() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffDEDEDE), borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Text(
            "schedule".tr + "schedule".tr,
            style: widgets.robotoConsid(color: Color(0xff62656A)),
          ),
        ),
      ),
    );
  }

  Widget scheduleBank() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(0xffDEDEDE),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10),
                  child: Text(
                    "payments_text".tr,
                    style: widgets.robotoConsid(color: Color(0xff62656A)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: getDropDownCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getDropDownCard() {
    final controller = Get.put(PaymentMethodController());
    return Obx(() {
      return Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppTextStyles.colorGrayMy),
            borderRadius: BorderRadius.circular(5)),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            items: controller.listBanks
                .map<DropdownMenuItem<String>>(
                    (String item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        ))
                .toList(),
            value: controller.selectedCountryPhone.value,
            onChanged: (String? value) {
              print("код страны телефона");
              print(value);
              controller.selectedCountryPhone.value = value!;
            },
          ),
        ),
      );
    });
  }
}
