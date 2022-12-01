import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles.dart';
import '../../widgets/app_icon.dart';
import 'verify_page_controller.dart';

class VerifyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: context.theme.background2,
        leading: BackButton(color: context.theme.mainTextColor),
        title: Text('login'.tr,
            style: AppTextStyles.roboto(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            )),
        actions: [
          IconButton(
            onPressed: () {
              // Get.back();
            },
            icon: const AppIcon(AppIcons.cancel),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'we_send_code_to'.tr + ':',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.mPlusRounded1c(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  GetBuilder<VerifyPageController>(
                      init: VerifyPageController(),
                      builder: (controller) {
                        return Text(
                          '+ (996) 770 770070',
                          style: AppTextStyles.mPlusRounded1c(
                              fontWeight: FontWeight.w700, fontSize: 14),
                        );
                      }),
                  const SizedBox(height: 5),
                  Text(
                    'enter_it_below'.tr + ':',
                    style: AppTextStyles.mPlusRounded1c(
                        fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  const SizedBox(height: 40),
                  GetBuilder<VerifyPageController>(builder: (controller) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        getPinField(
                          controller,
                          key: "1",
                          focusNode: controller.focusNode1,
                        ),
                        const SizedBox(width: 20.0),
                        getPinField(
                          controller,
                          key: "2",
                          focusNode: controller.focusNode2,
                        ),
                        const SizedBox(width: 20.0),
                        getPinField(
                          controller,
                          key: "3",
                          focusNode: controller.focusNode3,
                        ),
                        const SizedBox(width: 20.0),
                        getPinField(
                          controller,
                          key: "4",
                          focusNode: controller.focusNode4,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 20),
                  Text(
                    'get_code_in'.trParams({'time': '00:60'})!,
                    style: AppTextStyles.mPlusRounded1c(
                        color: Colors.grey, fontSize: 14),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'send_new_code'.tr,
                      style: AppTextStyles.robotoCondensed(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: context.theme.primary),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GetBuilder<VerifyPageController>(builder: (controller) {
                        return Checkbox(
                          value: controller.termsAgreed,
                          onChanged: (flag) {
                            controller.termsAgreed = flag!;
                            controller.checkCode();
                          },
                        );
                      }),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'i_agree_with_terms'.tr,
                          style: AppTextStyles.mPlusRounded1c(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getPinField(VerifyPageController controller,
          {required String key, FocusNode? focusNode}) =>
      SizedBox(
        height: 40.0,
        width: 35.0,
        child: TextField(
          key: Key(key),
          expands: false,
          autofocus: key.contains('1') ? true : false,
          focusNode: focusNode,
          onChanged: controller.inputCode,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          keyboardType: TextInputType.number,
          style:
              GoogleFonts.roboto(fontSize: 36.0, fontWeight: FontWeight.w400),
        ),
      );
}
