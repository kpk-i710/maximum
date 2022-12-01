import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../helpers/prefs.dart';
import '../../../widgets/widgets.dart' as widgets;
import 'payment_method_controller.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({Key? key}) : super(key: key);
  final controller = Get.put(PaymentMethodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'completed_orders'.tr,
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
                  select: DeliveryOrPayment.DELIVERY),
              buttonChoise(
                  text: 'select_payment_method',
                  icon: widgets.dollarSvg(),
                  select: DeliveryOrPayment.PAYMENT),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Theme(
                    data: ThemeData().copyWith(
                        dividerColor: Colors.transparent,
                        inputDecorationTheme: InputDecorationTheme(
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xff142A65), width: 1.0),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  width: 1, color: Colors.transparent),
                            ),
                            labelStyle: TextStyle(color: Color(0xff696A6A)))),
                    child: Column(
                      children: [
                        if (!Prefs.isLogin)
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: phoneNumberName(),
                          ),
                        if (Prefs.isLogin) expandTail(),
                        expandTrail2(),
                      ],
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
                            text: 'send'.tr.toUpperCase(),
                            onPressed: () {
                              Get.to(PaymentMethod());
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

  Widget expandTrail2() {
    return Obx(() {
      return ExpansionTile(
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.black,
        ),
        trailing: SizedBox(),
        title: Text(
          "apply_organization".tr,
          style: widgets.robotoConsid(fontSize: 14),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  style: TextStyle(color: Colors.blueAccent),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'company_name'.tr,
                  ),
                ),
                SizedBox(height: 15),
                TextField(
                  style: TextStyle(color: Colors.blueAccent),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    labelText: 'tin'.tr,
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
            ),
          )
        ],
      );
    });
  }

  Widget expandTail() {
    return ExpansionTile(
        collapsedBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.keyboard_arrow_down_sharp,
          color: Colors.black,
        ),
        trailing: SizedBox(),
        title: Text(
          "other_recipient".tr,
          style: widgets.robotoConsid(fontSize: 14),
        ),
        children: <Widget>[phoneNumberName()],
        onExpansionChanged: (bool expanded) {
          controller.demoList[0] = !expanded;
        });
  }

  Widget phoneNumberName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: Column(
        children: [
          TextField(
            style: TextStyle(color: Colors.blueAccent),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'last_name'.tr,
            ),
          ),
          SizedBox(height: 15),
          TextField(
            style: TextStyle(color: Colors.blueAccent),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              labelText: 'name'.tr,
            ),
          ),
          SizedBox(height: 15),
          Container(
            color: Colors.white,
            child: InternationalPhoneNumberInput(
              spaceBetweenSelectorAndTextField: 5,
              inputDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
              searchBoxDecoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
              ),
              onInputChanged: (PhoneNumber value) {},
              countries: ['RU', 'KG'],
              hintText: "enter_phone".tr,
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonChoise(
      {required String text,
      required Widget icon,
      required DeliveryOrPayment select}) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      child: GestureDetector(
        onTap: () {
          if (select == DeliveryOrPayment.DELIVERY) {
            controller.isSelectedDelivryMethod.value =
                !controller.isSelectedDelivryMethod.value;
            return;
          }
          if (select == DeliveryOrPayment.PAYMENT) {
            controller.isSelectedPaymentMethod.value =
                !controller.isSelectedPaymentMethod.value;
            return;
          }
        },
        child: !controller.currentStatusButton(select)
            ? Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Color(0xff991A4E)),
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
          Text(
            "Онлайн оплата VISA",
            style: widgets.robotoConsid(fontSize: 16),
          ),
          Spacer(),
          widgets.editSvg(),
          SizedBox(width: 5),
        ],
      ),
    ));
  }

  Widget delivaryButton() {
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
                    "free_shipping".tr,
                    style: widgets.robotoConsid(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Text(
                  "г.Бишкек, ул. Матыева 148",
                  style: widgets.robotoConsid(),
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
