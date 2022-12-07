import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/pages/user/profile/profile_page.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../helpers/prefs.dart';
import '../../../widgets/widgets.dart' as widgets;
import 'auth_enter_code_controller.dart';

class AuthEnterCode extends StatelessWidget {
  AuthEnterCode({Key? key}) : super(key: key);
  final controller = Get.put(AuthEnterCodeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      resizeToAvoidBottomInset: false,
      body: Obx(() {
        return widgets.getTheme(
          child: Column(
            children: [
              Flexible(flex: 1, child: Container()),
              Flexible(
                flex: 3,
                child: Column(
                  children: [
                    Text(
                      "we_have_sent_code".tr,
                      style: widgets.robotoConsid(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "+ (996) 550-88-25-88".tr,
                      style: widgets.robotoConsid(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "enter_it_below".tr,
                      style: widgets.robotoConsid(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: PinFieldAutoFill(
                          autoFocus: true,
                          codeLength: 4,
                          decoration: UnderlineDecoration(
                              colorBuilder:
                                  FixedColorBuilder(AppTextStyles.colorBlueMy),
                              textStyle: widgets.robotoConsid(
                                  fontSize: 25,
                                  color: AppTextStyles.colorBlueMy)),
                          onCodeChanged: (value) {
                            controller.receivedCode.value = value!;
                            print("onCodeChanged $value");
                            if (value == "5555" && controller.checkBox.value) {
                              Prefs.isLogin = true;
                              Get.back();
                              Get.back();
                            }
                          },
                          onCodeSubmitted: (val) {
                            print("onCodeSubmitted $val");
                          },
                          currentCode: controller.receivedCode.value),
                    ),
                    // picCode(context: context),
                    SizedBox(
                      height: 20,
                    ),
                    controller.checkFullCode()
                        ? Text(
                            "incorrect_code".tr,
                            style: widgets.robotoConsid(
                                color: AppTextStyles.colorRedMy),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "get_code_in".tr +
                          "${controller.formatedTime(timeInSecond: controller.timerInSecond.value.inSeconds)}",
                      style: widgets.robotoConsid(color: Color(0xffD4D4D4)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "send_new_code".tr,
                      style: widgets.robotoConsid(
                          color: AppTextStyles.colorBlueMy, fontSize: 16),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Theme(
                      data: ThemeData(
                          toggleableActiveColor: AppTextStyles.colorBlueMy),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Checkbox(
                                checkColor: Colors.white,
                                value: controller.checkBox.value,
                                onChanged: (newValue) {
                                  controller.checkBox.value = newValue!;
                                  if (controller.codeNumber.value == "5555" &&
                                      controller.checkBox.value) {
                                    Prefs.isLogin = true;
                                    Get.to(ProfilePage());
                                  }
                                },
                              ),
                              width: 30,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "i_agree_with_terms".tr,
                                overflow: TextOverflow.ellipsis,
                                style: widgets.robotoConsid(
                                    color: Color(0xffD4D4D4), fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    controller.checkBox.value
                        ? SizedBox()
                        : Text(
                            "Нужно принять соглашение",
                            style: widgets.robotoConsid(
                                color: AppTextStyles.colorRedMy),
                          ),
                  ],
                ),
              ),
              Flexible(flex: 1, child: Container())
            ],
          ),
        );
      }),
    );
  }
}
