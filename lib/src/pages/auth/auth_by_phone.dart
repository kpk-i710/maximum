import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../../helpers/app_router.dart';
import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';
import 'auth_by_phone_controller.dart';

class AuthByPhone extends StatelessWidget {
  final controller = Get.put(AuthByPhoneController());

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
      body: widgets.getTheme(
        child: Form(
          key: controller.loginFormKey1,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 5.0.h),
                Text(
                  'enter_phone_number'.tr,
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
                      onChanged: (value) {
                        print("длина номера $value");
                      },
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    "send_confirm_code_to_phone".tr,
                    textAlign: TextAlign.center,
                    style: widgets.robotoConsid(
                        color: Color(0xff808080), fontSize: 12),
                  ),
                ),
                SizedBox(height: 20),
                widgets.orderButton(
                    text: 'to_get_the_code'.tr,
                    onPressed: () {
                      controller.checkLogin();
                    }),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/auth');
                  },
                  child: Container(
                    height: 50,
                    width: Get.width,
                    color: Colors.transparent,
                    child: Center(
                      child: Text(
                        "login_with_password".tr,
                        style: widgets.robotoConsid(color: Color(0xff112B66)),
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
        ),
      ),
    );
  }
}
