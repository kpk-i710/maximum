import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../helpers/prefs.dart';
import '../../../../widgets/widgets.dart' as widgets;
import '../../shopping_cart_page_controller.dart';
import '../payment_method_controller.dart';
import 'change_address/change_address.dart';
import 'change_address/change_address_controller.dart';
import 'shipping_methods_controller.dart';

class ShippingMethodsPage extends StatelessWidget {
  ShippingMethodsPage({Key? key}) : super(key: key);

  final controller = Get.put(ShippingMethodsController());
  final controllerShoppingCart = Get.put(ShoppingCartPageController());
  final controllerPaymentMethod = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    print("эта нужная");

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          leading: BackButton(color: Colors.black),
          title: Text(
            'delivery_methods'.tr,
            style: widgets.robotoConsid(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: widgets.themeSelectDelivery(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  Flexible(
                    flex: 3,
                    child: PageView(
                        controller: controller.controllerPage,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          pageOne(),
                          pageTwoNewUser(),
                        ]),
                  ),
                  Flexible(flex: 1, child: selectBetweenTwo()),
                ],
              )),
        ));
  }

  Widget pageOne() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          buttonChoise1(
              courier: false,
              icon: widgets.anySvg(nameSvg: 'location_dark'),
              onTap: () {
                print("сейчас сохраненные адреса");
                final controller = Get.put(ChangeAdressController());

                print(controller.addressEnter
                    .map((adressList) => adressList.toJson())
                    .toList());
                Get.to(ChangeAdress(), arguments: ["points"]);
              }),
          SizedBox(height: 20),
          Text(
            "select_pickup_point".tr,
            style: widgets.robotoConsid(),
          ),
          selectRadio(text: "г.Бишкек, ПВЗ 4 мкрн. дом 6", index: 0,isPointIssue: true),
          selectRadio(text: "ПВЗ Восток 6, дом 8", index: 1,isPointIssue: true),
          selectRadio(text: "ПВЗ 4 мкрн. дом 6", index: 2,isPointIssue: true),
        ],
      ),
    );
  }

  Widget pageTwoLogined() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          buttonChoise(
              icon: widgets.anySvg(nameSvg: 'location_dark'),
              onTap: () {
                Get.to(
                  ChangeAdress(),
                );
              }),
          SizedBox(height: 20),
          Text(
            "select_pickup_point".tr,
            style: widgets.robotoConsid(),
          ),

          selectRadio(text: "г.Бишкек, ПВЗ 4 мкрн. дом 6", index: 0),
          selectRadio(text: "ПВЗ Восток 6, дом 8", index: 1),
          selectRadio(text: "ПВЗ 4 мкрн. дом 6", index: 2),
          selectRadio(text: "Габаритный груз", index: 3),
          selectRadio(text: "Согласовать с менеджером", index: 4),
        ],
      ),
    );
  }

  Widget pageTwoNewUser() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            "enter_your_address".tr,
            style: widgets.robotoConsid(),
          ),
          SizedBox(height: 20),
          buttonChoise1(
              icon: widgets.anySvg(nameSvg: 'location_dark'),
              courier: true,
              onTap: () {
                Get.to(
                  ChangeAdress(),
                );
              }),
          SizedBox(height: 20),
          Text(
            "choose_shipping_method".tr,
            style: widgets.robotoConsid(),
          ),
          selectRadio(text: "Бесплатная доставка", index: 0),
          selectRadio(text: "Доставка по городу", index: 1),
          selectRadio(text: "Габаритный груз", index: 3),
          selectRadio(text: "Согласовать с менеджером", index: 4),
        ],
      ),
    );
  }

  Widget selectBetweenTwo() {
    return Column(
      children: [
        Spacer(),
        Row(
          children: [
            Expanded(
                child: courierButton(
                    text: 'point_of_issue'.tr,
                    onPressed: () {
                      controller.selectedPage.value = 0;
                      controller.jump(0);
                    },
                    index: 0,
                    icon: widgets.anySvg(
                        nameSvg: 'point_of_issue', size: Size(25, 25)))),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: courierButton(
                text: 'courier'.tr,
                onPressed: () {
                  controller.selectedPage.value = 1;
                  controller.jump(1);
                },
                index: 1,
                icon: widgets.anySvg(nameSvg: 'car_blue', size: Size(20, 20)),
              ),
            )
          ],
        ),
        SizedBox(height: 20),
        widgets.saveButton(
            text: 'checkout'.tr.toUpperCase(),
            onPressed: () {
              if (controller.selectedPage.value == 1 &&
                  controllerPaymentMethod.isSelectedDelivryPayMethod.value ==
                      false) {
                return;
              }
              if (controller.selectedPage.value == 0) {
                controllerPaymentMethod.isSelectedDelivryFreeMethod.value =
                    true;
              }
              Get.back();
            }),
        SizedBox(height: 20),
      ],
    );
  }

  Widget courierButton(
      {required String text,
      Function()? onPressed,
      required int index,
      required Widget icon}) {
    return Obx(() {

      return Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: index == controller.selectedPage.value
                ? Color(0xffD9D9D9)
                : Colors.white,
            borderRadius: BorderRadius.circular(5)),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: Colors.transparent, shadowColor: Colors.transparent),
          icon: icon,
          label: Text(
            text,
            style: widgets.robotoConsid(
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      );
    });
  }

  Widget schedule() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xffDEDEDE), borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Text(
            "schedule".tr,
            style: widgets.robotoConsid(color: Color(0xff62656A)),
          ),
        ),
      ),
    );
  }

  Widget selectRadio({required String text, required int index,bool isPointIssue = false}) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                if(isPointIssue){
                  final box = GetStorage();
                  box.write("PosintIssue", text);
                }

                controller.change(index);

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
                        controller.change(index);
                      },
                    ),
                    SizedBox(width: 15),
                    Text(
                      "$text",
                      style: index == controller.selectedRadio.value
                          ? widgets.robotoConsid(color: Colors.white)
                          : widgets.robotoConsid(color: Color(0xff727272)),
                    )
                  ],
                ),
              ),
            ),
            if (index == controller.selectedRadio.value) schedule()
          ],
        ),
      );
    });
  }

  Widget buttonChoise({required Widget icon, required Function() onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: widgets.boxShadows(
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            height: 30,
            child: Row(
              children: [
                SizedBox(width: 20),
                icon,
                SizedBox(width: 15),
                Text(
                  "${controllerShoppingCart.selectedCity.value} ".tr,
                  style: widgets.robotoConsid(fontSize: 16),
                ),
                Spacer(),
                widgets.editSvg(),
                SizedBox(width: 10),
              ],
            ),
          ),
        ));
  }

  Widget buttonChoise1(
      {required Widget icon,
      required Function() onTap,
      required bool courier}) {
    return Obx(() {
      return GestureDetector(
          onTap: onTap,
          child: getRedBoder(
            courier: courier,
            child: Row(
              children: [
                SizedBox(width: 20),
                icon,
                SizedBox(width: 15),
                // Text("sdf"),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "${controllerShoppingCart.selectedCity.value} ${controller.isTwopage() ? controllerShoppingCart.selectedStreetHouse.value ?? "" : ""}   "
                              .tr,
                          style: widgets.robotoConsid(fontSize: 16),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: widgets.editSvg(),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ));
    });
  }

  Widget getRedBoder({required Widget child, required bool courier}) {
    if (courier) {
      return controllerPaymentMethod.isSelectedDelivryPayMethod.value
          ? widgets.boxShadows(
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  // height: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 5.0,
                      bottom: 5,
                    ),
                    child: child,
                  )))
          : Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(5)),
              // height: 50,
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 15.0, bottom: 15, right: 10),
                child: child,
              ));
    }
    return widgets.boxShadows(
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
            // height: 30,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 5.0,
                bottom: 5,
              ),
              child: child,
            )));
  }
}
// controller.isFirstpage()
// ? Padding(
// padding: const EdgeInsets.only(left: 50.0, top: 10),
// child: Text(
// "Пункт выдачи Матыева 148",
// style: widgets.robotoConsid(color: Colors.grey),
// ),
// )
// : SizedBox()
