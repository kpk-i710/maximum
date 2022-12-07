import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../../styles.dart';
import '../../../widgets/widgets.dart' as widgets;

import 'auth_page_controller.dart';
import '../auth_by_phone.dart';

class AuthPage extends StatelessWidget {
  final controller = Get.put(AuthPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: SizedBox(),
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: widgets.anySvg(nameSvg: "close_auth"),
            ),
          ],
        ),
        body: Form(
          key: controller.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 5.0.h),
                Text(
                  'enter_your_phone_for_login'.tr,
                  style: widgets.robotoConsid(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.0.h),
                const SizedBox(height: 5),
                widgets.getTheme(
                  child: Container(
                    height: 70,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: controller.phoneCont,
                      decoration: InputDecoration(
                        prefixIcon: widgets.getDropDownPhone(),
                        labelText: 'phone_number'.tr,
                        isDense: true,
                        helperText: " ",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(width: 1, color: Colors.grey),
                        ),
                      ),
                      onSaved: (value) {
                        controller.phoneNumber = value!;
                      },
                      validator: (value) {
                        return controller.validatePhone(value!);
                      },
                      onChanged: (value) {},
                    ),
                  ),
                ),
                SizedBox(height: 5),
                GetBuilder<AuthPageController>(
                    init: AuthPageController(),
                    builder: (controller) {
                      return Obx(() {
                        return Container(
                          height: 70,
                          child: widgets.getTheme(
                            child: TextFormField(

                              controller: controller.passwordController,
                              obscureText: !controller.passwordVisible.value,
                              decoration: InputDecoration(
                                isDense: true,
                                helperText: " ",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                      controller.passwordVisible.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: AppTextStyles.colorBlueMy),
                                  onPressed: () {
                                    controller.passwordVisible.value =
                                        !controller.passwordVisible.value;
                                    print(!controller.passwordVisible.value);
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                labelText: 'password'.tr,
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffB7B7B7), width: 1.0),
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              onSaved: (value) {
                                controller.password = value!;
                              },
                              validator: (value) {
                                return controller.validatePassword(value!);
                              },
                            ),
                          ),
                        );
                      });
                    }),
                SizedBox(height: 10),
                widgets.orderButton(
                    text: 'to_come_in'.tr,
                    onPressed: () {
                      controller.checkLogin();
                    }),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "login_with_code".tr,
                        style: widgets.robotoConsid(
                            color: AppTextStyles.colorBlueMy),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 76,
                )
              ],
            ),
          ),
        ));
  }
}
