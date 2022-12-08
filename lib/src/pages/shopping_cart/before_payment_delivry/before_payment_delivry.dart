import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/pages/shopping_cart/before_payment_delivry/payment_method/payment_method_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../../helpers/prefs.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../shopping_cart_page_controller.dart';
import 'before_payment_delivry_controller.dart';
import 'shipping_methods/shipping_methods_controller.dart';
import 'shipping_methods/shipping_methods_page.dart';

class BeforePaymentDelivry extends StatelessWidget {
  BeforePaymentDelivry({Key? key}) : super(key: key);
  final controller = Get.put(BeforPaymentDevliryController());
  final controllerShoppingCart = Get.put(ShoppingCartPageController());
  final controllerShippingMethods = Get.put(ShippingMethodsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'cart'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(() {
          return Column(
            children: [
              buttonChoise(
                  text: 'choose_shipping_method',
                  icon: widgets.truckSvg(),
                  select: DeliveryOrPayment.DELIVERY,
                  onTap: () {
                    Get.toNamed(AppRouter.shippingMethodsPage);
                  }),
              buttonChoise(
                  text: 'select_payment_method',
                  icon: widgets.dollarSvg(),
                  select: DeliveryOrPayment.PAYMENT,
                  onTap: () {
                    Get.toNamed(AppRouter.paymentMethod);
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: widgets.getTheme(
                    child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      if (!Prefs.isLogin)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: phoneNumberName(),
                        ),
                      if (Prefs.isLogin) expandTail(),
                      SizedBox(height: 8),
                      buyForOrganization(),
                    ],
                  ),
                )),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 35.0, horizontal: 30),
                  child: Container(
                    child: Column(
                      children: [
                        widgets.rowText(
                            text1: 'Товары, 1 шт.', text2: '119 990 с.'),
                        widgets.rowText(
                            text1: 'discount'.tr, text2: '10 800 с.'),
                        widgets.rowText(
                            text1: 'delivery'.tr, text2: '10 800 с.'),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Итого:",
                              style: widgets.robotoConsid(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              "109 190 с.",
                              style: widgets.robotoConsid(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        widgets.orderButton(
                            text: 'checkout1'.tr.toUpperCase(),
                            onPressed: () {
                              controller.checkLogin();
                            }),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(
                            "agreement".tr,
                            style: widgets.robotoConsid(
                                color: Color(0xff62656A), fontSize: 11),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buyForOrganization() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.5),
        child: Container(
          child: ConfigurableExpansionTile(
            header: Container(
              width: Get.width - 15,
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Icon(
                    Icons.keyboard_arrow_down_sharp,
                    color: Colors.black,
                  ),
                  Text(
                    "apply_organization".tr,
                    textAlign: TextAlign.start,
                    style: widgets.robotoConsid(fontSize: 14),
                  ),
                ],
              ),
            ),
            childrenBody: Column(children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {
                            controller.nameCompany = value!;
                          },
                          validator: (value) {
                            return controller.validateCompanyName(value!);
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            helperText: " ",
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'company_name'.tr,
                          ),
                          controller: controller.nameCompanyController,
                        ),
                      ),
                      SizedBox(height: 10),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {
                            controller.firstName = value!;
                          },
                          validator: (value) {
                            return controller.validateInnCompay(value!);
                          },
                          controller: controller.innCompayController,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(14),
                          ],
                          decoration: InputDecoration(
                            isDense: true,
                            helperText: " ",
                            filled: true,
                            fillColor: Colors.white,
                            labelText: 'tin'.tr,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          FlutterSwitch(
                            inactiveColor: Color(0xffC9CDD6),
                            activeColor: Color(0xff2B2861),
                            width: 60.0,
                            height: 30.0,
                            valueFontSize: 25.0,
                            toggleSize: 20.0,
                            value: controller.status.value,
                            borderRadius: 30.0,
                            padding: 5.0,
                            showOnOff: false,
                            onToggle: (val) {
                              controller.status.value = val;
                            },
                          ),
                          SizedBox(width: 10),
                          Text(
                            "include_vat".tr,
                            style: widgets.robotoConsid(
                                fontSize: 18, color: Color(0xff543339)),
                          )
                        ],
                      ),
                    ],
                  )),
            ]),
          ),
        ),
      );
    });
  }

  Widget expandTail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: ConfigurableExpansionTile(
          header: Container(
            width: Get.width - 19,
            child: Row(
              children: [
                SizedBox(width: 20),
                Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Colors.black,
                ),
                Text(
                  "other_recipient".tr,
                  textAlign: TextAlign.start,
                  style: widgets.robotoConsid(fontSize: 14),
                ),
              ],
            ),
          ),
          childrenBody: Column(
            children: [phoneNumberName()],
          ),
          onExpansionChanged: (bool expanded) {
            controller.demoList[0] = !expanded;
          }),
    );
  }

  Widget sizeTextFild({required Widget child}) {
    return SizedBox(height: 70, child: child);
  }

  Widget phoneNumberName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        children: [
          sizeTextFild(
            child: TextFormField(
              controller: controller.lastNameController,
              onSaved: (value) {
                controller.lastName = value!;
              },
              validator: (value) {
                return controller.validateLastName(value!);
              },
              decoration: InputDecoration(
                isDense: true,
                helperText: " ",
                filled: true,
                fillColor: Colors.white,
                labelText: 'last_name'.tr,
              ),
            ),
          ),
          SizedBox(height: 10),
          sizeTextFild(
            child: TextFormField(
              controller: controller.firstNameController,
              onSaved: (value) {
                controller.firstName = value!;
              },
              validator: (value) {
                return controller.validateFirstName(value!);
              },
              decoration: InputDecoration(
                isDense: true,
                filled: true,
                helperText: " ",
                fillColor: Colors.white,
                labelText: 'name'.tr,
              ),
            ),
          ),
          SizedBox(height: 10),
          sizeTextFild(
            child: Container(
              height: 70,
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.numberPhoneController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: widgets.getDropDownPhone(),
                  labelText: 'phone_number'.tr,
                  helperText: " ",
                  isDense: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(width: 1, color: Colors.transparent),
                  ),
                ),
                onSaved: (value) {
                  controller.numberPhone = value!;
                },
                validator: (value) {
                  return controller.validateNumberPhone(value!);
                },
                onChanged: (value) {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  // if (select == DeliveryOrPayment.DELIVERY) {
  //   controller.isSelectedDelivryMethod.value =
  //       !controller.isSelectedDelivryMethod.value;
  //   return;
  // }
  // if (select == DeliveryOrPayment.PAYMENT) {
  //   controller.isSelectedPaymentMethod.value =
  //       !controller.isSelectedPaymentMethod.value;
  //   return;
  // }

  Widget buttonChoise(
      {required String text,
      required Widget icon,
      required DeliveryOrPayment select,
      required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: GestureDetector(
        onTap: onTap,
        child: !controller.currentStatusButton(select)
            ? Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(width: 2, color: AppTextStyles.colorRedMy),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 50,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    icon,
                    SizedBox(width: 15),
                    Text(
                      "$text".tr,
                      style: widgets.robotoConsid(fontSize: 16),
                    ),
                    Spacer(),
                    SvgPicture.asset('assets/icons/warning.svg'),
                    SizedBox(width: 10),
                  ],
                ),
              )
            : select == DeliveryOrPayment.PAYMENT
                ? visaButton()
                : delivaryButton(),
      ),
    );
  }

  Widget visaButton() {
    final controller = Get.put(PaymentMethodController());
    return widgets.boxShadows(
        child: Container(
      height: 30,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          widgets.dollarSvg(),
          SizedBox(
            width: 15,
          ),
          Flexible(
            child: SizedBox(
              width: Get.width,
              child: Text(
                overflow: TextOverflow.ellipsis,
                controller.listPayments[controller.selectedRadio.value],
                maxLines: 1,
                style: widgets.robotoConsid(fontSize: 16),
              ),
            ),
          ),


          widgets.editSvg(),
          SizedBox(width: 5),
        ],
      ),
    ));
  }

  Widget delivaryButton() {
    final box = GetStorage();
    return widgets.boxShadows(
        child: Container(
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  widgets.truckSvg(),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    controllerShippingMethods.selectedPage.value == 0
                        ? "free_shipping".tr
                        : "express_delivery".tr,
                    style: widgets.robotoConsid(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 5),
              SizedBox(
                width: Get.width * 0.7,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Text(
                    controllerShippingMethods.selectedPage.value == 1
                        ? "${controllerShoppingCart.selectedCity.value} ${controllerShoppingCart.selectedStreetHouse.value ?? ""}"
                        : "${controllerShoppingCart.selectedCity.value} "
                            "${box.read("PosintIssue") ?? ""}",
                    overflow: TextOverflow.ellipsis,
                    style: widgets.robotoConsid(),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          widgets.editSvg(),
          SizedBox(width: 5),
        ],
      ),
    ));
  }
}
