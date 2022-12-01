import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../helpers/app_router.dart';
import '../../styles.dart';
import '../../widgets/app_icon.dart';
import '../user/profile/profile_page.dart';
import 'auth_page_controller.dart';

class AuthPage extends StatelessWidget {
  final controller = Get.put(AuthPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background2,
      appBar: AppBar(
        elevation: 1,
        leading: BackButton(color: context.theme.secondary),
        backgroundColor: context.theme.background2,
        title: Text(
          'login'.tr,
          style:
              AppTextStyles.roboto(fontSize: 24, fontWeight: FontWeight.w400),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: AppIcon(AppIcons.cancel),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              SizedBox(height: 5.0.h),
              Text(
                'auth_desc'.tr,
                style: AppTextStyles.mPlusRounded1c(
                    fontWeight: FontWeight.w500, fontSize: 15.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.0.h),
              Container(
                child: Image.asset('assets/images/fingers_id.png',
                    width: 150, height: 150),
              ),
              SizedBox(height: 8.0.h),
              Container(
                width: double.infinity,
                child: Text(
                  'phone_number'.tr,
                  style: AppTextStyles.mPlusRounded1c(
                    fontWeight: FontWeight.w400,
                    color: context.theme.mainTextColor.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  GetBuilder<AuthPageController>(
                      init: AuthPageController(),
                      builder: (controller) {
                        return Text(
                          '${controller.countryCode}',
                          style: AppTextStyles.mPlusRounded1c(
                              fontWeight: FontWeight.bold, fontSize: 24.0),
                        );
                      }),
                  const SizedBox(width: 10),
                  Expanded(
                    child:
                        GetBuilder<AuthPageController>(builder: (controller) {
                      return TextFormField(
                        controller: controller.phoneCont,
                        style: AppTextStyles.mPlusRounded1c(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                        maxLength: 12,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          border: InputBorder.none,
                          counterText: '',
                          hintText: '770-70-70-70',
                        ),
                        onChanged: (value) {
                          controller.phoneWithOutCodeCountry = value!;
                        },
                        validator: (value) {
                          return controller.validatePhone(value!);
                        },
                        keyboardType: TextInputType.number,
                      );
                    }),
                  ),
                  GetBuilder<AuthPageController>(builder: (controller) {
                    return DropdownButtonHideUnderline(
                      child: DropdownButton(
                          value: controller.countryCode,
                          items: [
                            DropdownMenuItem(
                                value: '+ (996)',
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/flag_kg.png'),
                                  ],
                                )),
                            DropdownMenuItem(
                                value: '+ (7)',
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/flag_ru.png'),
                                  ],
                                )),
                            DropdownMenuItem(
                                value: '+ (44)',
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/flag_us.png'),
                                  ],
                                )),
                            DropdownMenuItem(
                                value: '+ (998)',
                                child: Row(
                                  children: [
                                    Image.asset('assets/images/flag_uz.png'),
                                  ],
                                )),
                          ],
                          onChanged: (value) {
                            controller.countryCode = value.toString();
                          }),
                    );
                  })
                ],
              ),
              GetBuilder<AuthPageController>(
                  init: AuthPageController(),
                  builder: (controller) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controller.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'password'.tr,
                        ),
                        onSaved: (value) {
                          controller.password = value!;
                        },
                        validator: (value) {
                          return controller.validatePassword(value!);
                        },
                      ),
                    );
                  }),
              const Divider(),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child:
                          GetBuilder<AuthPageController>(builder: (controller) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            primary: context.theme.primaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 18.0, vertical: 10),
                          ),
                          onPressed: controller.isLoading
                              ? null
                              : () async {
                                  final phone = controller.countryCode +
                                      controller.phoneCont.text;
                                  var val = await controller.auth(phone);

                                  controller.checkLogin();
                                },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              controller.isLoading
                                  ? Row(
                                      children: [
                                        const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator()),
                                        const SizedBox(width: 15)
                                      ],
                                    )
                                  : const SizedBox(),
                              Text(
                                'login'.tr,
                                style: AppTextStyles.robotoCondensed(
                                  color: context.theme.onPrimary,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
