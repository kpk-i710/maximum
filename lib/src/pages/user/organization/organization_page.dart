import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../../widgets/widgets.dart' as widgets;
import 'organization_page_controller.dart';

class OrganizationPage extends StatelessWidget {
  OrganizationPage({Key? key}) : super(key: key);
  final controller = Get.put(OrganizationPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: widgets.getThemeBorderGreyTextFild(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Form(
              key: controller.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  Text(
                    'organization'.tr,
                    style: AppTextStyles.robotoCondensed(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                      height: 50,
                      child: DropdownButtonFormField<String>(
                          hint: Text(
                            "your_city".tr,
                            style: widgets.robotoConsid(),
                          ),
                          icon: SizedBox(),
                          value: controller.selectedTypeOrganiz.value,
                          items: controller.organizTypeList
                              .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: widgets.robotoConsid(),
                                  )))
                              .toList(),
                          onChanged: (String? value) {
                            controller.selectedTypeOrganiz.value = value!;
                          })),

                  SizedBox(height: 20),
                  // organization_type.tr
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.fullNameOrganiz = value!;
                      },
                      validator: (value) {
                        return controller.validateFullNameOrganiz(value!);
                      },
                      controller: controller.fullNameOrganizController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'full_name_organization'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.inn = value!;
                      },
                      validator: (value) {
                        return controller.validateInn(value!);
                      },
                      controller: controller.innController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'tin'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.address = value!;
                      },
                      validator: (value) {
                        return controller.validateAddress(value!);
                      },
                      controller: controller.addressController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'address'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.bank = value!;
                      },
                      validator: (value) {
                        return controller.validateBank(value!);
                      },
                      controller: controller.bankController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'bank'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.payment = value!;
                      },
                      validator: (value) {
                        return controller.validatePayment(value!);
                      },
                      controller: controller.paymentController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'checking_account'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.bik = value!;
                      },
                      validator: (value) {
                        return controller.validateBik(value!);
                      },
                      controller: controller.bikController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'bic'.tr,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  sizeTextFild(
                    child: TextFormField(
                      onSaved: (value) {
                        controller.email = value!;
                      },
                      validator: (value) {
                        return controller.validateEmail(value!);
                      },
                      controller: controller.emailController,
                      decoration: InputDecoration(
                        helperText: " ",
                        labelText: 'email'.tr,
                      ),
                    ),
                  ),

                  SizedBox(height: 40),
                  widgets.saveButton(
                      text: 'save',
                      onPressed: () {
                        controller.checkSave();
                      }),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  Widget sizeTextFild({required Widget child}) {
    return SizedBox(height: 70, child: child);
  }
}
