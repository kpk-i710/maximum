import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/user/add_phone/add_phone_page_controller.dart';
import '../../../widgets/widgets.dart' as widgets;

class AddPhonePage extends StatelessWidget {
  final controller = Get.put(AddPhonePageController());

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
                              controller.delatePhone(i);
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
                              borderSide: BorderSide(width: 1, color: Colors.grey),
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
                              onChanged: (value) {
                                controller.isWhatsUp.value = value!;
                              }),
                          SizedBox(width: 20),
                          widgets.checkBoxWithIcon(
                              value: controller.isTelegram.value,
                              icon: Icon(
                                Icons.telegram,
                                color: Colors.blue,
                              ),
                              onChanged: (value) {
                                print(value);
                                controller.isTelegram.value = value!;
                              }),
                        ],
                      ),
                      widgets.addAdressButton(
                          text: "add_number".tr,
                          onPressed: () {
                            controller.checkSave();
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

  Widget sizeTextFild({required Widget child}) {
    return SizedBox(height: 70, child: child);
  }
}
