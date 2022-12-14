import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/user/add_phone/add_phone_page_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../../auth/auth_page/auth_page_controller.dart';

class AddPhonePage extends StatelessWidget {
  final controller = Get.put(AddPhonePageController());
  final controllerAuth = Get.put(AuthPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: widgets.getThemeBorderGreyTextFild(
          child: Obx(() {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Form(
                  key: controller.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      Text('my_contacts'.tr,
                          style: widgets.robotoConsid(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 15),
                      for (int i = 0; i < controller.phoneList.length; i++)
                        widgets.selectRadio(
                            text: controller.phoneList[i].number,
                            index: i,
                            isTelegram: controller.phoneList[i].telegram,
                            isWhatsUp: controller.phoneList[i].whatsApp,
                            onTap: () {
                              dialogShow(context: context, index: i);
                            }),
                      SizedBox(height: 20),
                      Container(
                        height: 70,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controller.phoneController,
                          decoration: InputDecoration(
                            prefixIcon: widgets.getDropDownPhone(),
                            labelText: 'enter_phone'.tr,
                            helperText: " ",
                            isDense: true,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey),
                            ),
                          ),
                          onSaved: (value) {
                            controller.phoneNum.value = value!;
                          },
                          validator: (value) {
                            return controller.validatePhone(value!);
                          },
                          onChanged: (value) {
                            controller.phoneNum.value = value;
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Text("phone_number_has".tr),
                      Row(
                        children: [
                          widgets.checkBoxWithIcon(
                              value: controller.isWhatsUp.value,
                              icon: Icon(Icons.whatsapp, color: Colors.green),
                              onChanged: () {
                                controller.isWhatsUp.value =
                                    !controller.isWhatsUp.value;
                              }),
                          SizedBox(width: 20),
                          widgets.checkBoxWithIcon(
                              value: controller.isTelegram.value,
                              icon: Icon(
                                Icons.telegram,
                                color: Colors.blue,
                              ),
                              onChanged: () {
                                controller.isTelegram.value =
                                    !controller.isTelegram.value;
                              }),
                        ],
                      ),
                      widgets.addAdressButton(
                          text: "add_number".tr,
                          onPressed: () {
                            controller.receivedCode.value = "";
                            if (controller.checkSave()) {
                              widgets.showConfirmCodePhone(
                                  context: context,
                                  number: controllerAuth
                                          .selectedCountryPhone.value +
                                      "-" +
                                      controller.phoneNum.value);
                            }
                          }),
                      SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  void dialogShow({required BuildContext context, required int index}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "confirm".tr,
              style: widgets.robotoConsid(),
            ),
            content: Text(
              "remove".tr + " " + controller.phoneList[index].number + " ?",
              style: widgets.robotoConsid(),
            ),
            actions: [
              widgets.alertButton(
                onTap: () {
                  controller.delitePhone(index);
                  Navigator.of(context).pop();
                },
                text: 'yes',
              ),
              widgets.alertButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                text: 'not',
              ),
            ],
          );
        });
  }

  Widget sizeTextFild({required Widget child}) {
    return SizedBox(height: 70, child: child);
  }
}
