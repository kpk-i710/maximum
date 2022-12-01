import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import '../../../../../helpers/prefs.dart';
import '../../../../../widgets/widgets.dart' as widgets;
import '../../../shopping_cart_page_controller.dart';
import '../../payment_method_controller.dart';
import '../shipping_methods_controller.dart';
import 'change_address_controller.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ChangeAdress extends StatefulWidget {
  ChangeAdress({Key? key}) : super(key: key);

  @override
  State<ChangeAdress> createState() => _ChangeAdressState();
}

class _ChangeAdressState extends State<ChangeAdress> {
  final controller = Get.put(ChangeAdressController());

  final controllerCart = Get.put(ShoppingCartPageController());

  final controllerPaymentMethod = Get.put(PaymentMethodController());

  final controllerShippingMethods = Get.put(ShippingMethodsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'change_address'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: widgets.themeChangeAdress(
        child: pageNewUser(),
      ),
    );
  }

  Widget pageNewUser() {
    return Obx(() {
      return Stack(
        children: [
          YandexMap(
            mapObjects: controller.mapObjects.value,
            onMapCreated: (YandexMapController yandexMapController) async {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                wigetForNewUser(),
                Spacer(),
                widgets.saveButton(
                    text: "save",
                    onPressed: () {
                     if(controller.checkAdress()){
                       if (controllerShippingMethods.selectedPage.value == 0) {
                         controllerPaymentMethod.isSelectedDelivryFreeMethod.value = true;
                       }
                       if (controllerShippingMethods.selectedPage.value == 1) {
                         controllerPaymentMethod.isSelectedDelivryPayMethod.value =
                         true;
                       }
                     }


                    }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget wigetForNewUser() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          GetBuilder<ShoppingCartPageController>(builder: (context) {
            return Form(
              key: controller.loginFormKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 55,
                    child: DropdownButtonFormField<String>(
                        hint: Text(
                          "your_city".tr,
                          style: widgets.robotoConsid(),
                        ),
                        icon: SizedBox(),
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xffC4C4C4), width: 1.0),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                width: 1,
                                color: Color(0xffC4C4C4),
                              )),
                          focusColor: Color(0xffC4C4C4),
                        ),
                        value: controllerCart.selectedCity.value,
                        items: controllerCart.citys!
                            .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: widgets.robotoConsid(),
                                )))
                            .toList(),
                        onChanged: (item) {
                          print(item);
                          controllerCart.selectedCity.value = item!;
                        }),
                  ),
                  SizedBox(height: 20),
                  Get.arguments[0] == "courier"
                      ? Column(
                          children: [
                            TextFormField(
                              onSaved: (value) {
                                controller.streetName = value!;
                              },
                              validator: (value) {
                                return controller.validateStritName(value!);
                              },
                              controller: controller.streetController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                labelText: 'street'.tr,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    onSaved: (value) {
                                      controller.houseName = value!;
                                    },
                                    validator: (value) {
                                      return controller
                                          .validateHouseName(value!);
                                    },
                                    controller: controller.houseController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'home_address'.tr,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Flexible(
                                  flex: 1,
                                  child: TextFormField(
                                    onSaved: (value) {
                                      controller.apartament = value!;
                                    },
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      labelText: 'apartment'.tr,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : SizedBox(),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // Widget pageOldUser() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 15.0),
  //     child: Column(
  //       children: [
  //         selectRadio(text: "г.Бишкек, ПВЗ 4 мкрн. дом 6", index: 0),
  //         selectRadio(text: "г.Бишкек, ПВЗ 4 мкрн. дом 6", index: 1),
  //         SizedBox(height: 20),
  //         addAdressButton(text: 'add_address'.tr),
  //         Spacer(),
  //         widgets.saveButton(
  //             text: "save",
  //             onPressed: () {
  //
  //
  //               Get.back();
  //             }),
  //         SizedBox(height: 20),
  //       ],
  //     ),
  //   );
  // }

  Widget addAdressButton({required String text, Function()? onPressed}) {
    return SizedBox(
      height: 50,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Color(0xff142A65),
                  width: 2.0,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10),
                Text("+",
                    style: TextStyle(color: Color(0xff142A65), fontSize: 20)),
                SizedBox(width: 5),
                Text(text,
                    textAlign: TextAlign.center,
                    style: widgets.robotoConsid(
                        color: Color(0xff142A65),
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ],
            )),
      ),
    );
  }

  Widget selectRadio({required String text, required int index}) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                // controller.change(index);
              },
              child: widgets.boxShadows(
                padding: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Radio(
                        activeColor: Color(0xff112B66),
                        value: index,
                        groupValue: controller.selectedRadio.value,
                        onChanged: (int? value) {
                          // controller.change(index);
                        },
                      ),
                      SizedBox(width: 15),
                      Text(
                        "$text",
                        style: widgets.robotoConsid(color: Color(0xff2C2D2E)),
                      ),
                      Spacer(),
                      widgets.anySvg(nameSvg: "trash"),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
