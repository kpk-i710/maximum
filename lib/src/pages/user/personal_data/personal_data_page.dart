import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;
import 'personal_data_page_controller.dart';

class PersonalDataPage extends StatelessWidget {
  final controller = Get.put(PersonalDataPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      Text(
                        'personal_data1'.tr,
                        style: AppTextStyles.robotoCondensed(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 20),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {
                            controller.lastName = value!;
                          },
                          validator: (value) {
                            return controller.validateLastName(value!);
                          },
                          controller: controller.lastNameController,
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'last_name'.tr,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {
                            controller.name = value!;
                          },
                          validator: (value) {
                            return controller.validateName(value!);
                          },
                          controller: controller.nameController,
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'name'.tr,
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {},
                          validator: (value) {},
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'middle_name'.tr,
                          ),
                        ),
                      ),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {},
                          validator: (value) {},
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'tin'.tr,
                          ),
                        ),
                      ),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {},
                          validator: (value) {},
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'date_of_birth'.tr,
                          ),
                        ),
                      ),
                      sizeTextFild(
                        child: TextFormField(
                          onSaved: (value) {},
                          validator: (value) {},
                          decoration: InputDecoration(
                            helperText: " ",
                            labelText: 'job_position'.tr,
                          ),
                        ),
                      ),
                      Text(
                        "your_gender".tr,
                        style: widgets.robotoConsid(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          widgets.radioGender(index: 0, text: "female"),
                          widgets.radioGender(index: 1, text: "male"),
                        ],
                      ),
                      SizedBox(height: 40),
                      widgets.saveButton(
                          text: 'save',
                          onPressed: () {
                            controller.checkSave();
                          }),
                      SizedBox(height: 20),
                      Text(
                        "send_confirm_code_to_phone".tr,
                        textAlign: TextAlign.center,
                        style: widgets.robotoConsid(fontSize: 12),
                      ),
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
