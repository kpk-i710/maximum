import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../styles.dart';
import '../../../widgets/app_icon.dart';
import '../../../helpers/app_router.dart';
import '../../../widgets/widgets.dart' as widgets;
import '../../../widgets/profile_percent_widget.dart';
import '../../../pages/user/profile_params/profile_params_page_controller.dart';

class ProfileParamsPage extends StatelessWidget {
  final controller = Get.put(ProfileParamsPageController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed(AppRouter.main, arguments: 4);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () { Get.toNamed(AppRouter.personalData); },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Мурахмедов Анвар Рашидович',
                                style: AppTextStyles.robotoCondensed(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const AppIcon(
                                      AppIcons.profile_circle_outlined, size: 18),
                                  const SizedBox(width: 5),
                                  Text('personal_data'.tr,
                                    style: AppTextStyles.mPlusRounded1c(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          child: IntrinsicHeight(
                            child: Row(
                              children: [
                                const VerticalDivider(thickness: 1.3),
                                const SizedBox(width: 15),
                                AppIcon(
                                  AppIcons.notification,
                                  size: 28,
                                  color: context.theme.grey,
                                ),
                                const SizedBox(width: 15),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const ProfilePercentWidget(percent: 40),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Get.context!.theme.focus,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Get.context!.theme.onFocus,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  children: [
                                    Text('your_birthday'.tr,
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 12,
                                        color: context.theme.mainTextColor
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text('22.12.1895',
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Get.context!.theme.onFocus,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Column(
                                  children: [
                                    Text('enter_your_gender'.tr + ':',
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 12,
                                        color: context.theme.mainTextColor
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text('not_specified'.tr,
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 12,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: Get.context!.theme.onFocus,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  children: [
                                    Text('0550882588',
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 20,
                                        color: context.theme.mainTextColor
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () { Get.toNamed(AppRouter.addPhone); },
                              child: Container(
                                height: 60,
                                width: 60,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                decoration: BoxDecoration(
                                  color: Get.context!.theme.onFocus,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Icon(Icons.add,
                                  size: 40, color: context.theme.grey,
                                )
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 60,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                                decoration: BoxDecoration(
                                  color: Get.context!.theme.onFocus,
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Row(
                                  children: [
                                    Text('delivery_address'.tr,
                                      style: AppTextStyles.robotoCondensed(
                                        fontSize: 20,
                                        color: context.theme.mainTextColor
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () { Get.toNamed(AppRouter.addAddress); },
                              child: Container(
                                  height: 60,
                                  width: 60,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    color: Get.context!.theme.onFocus,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Icon(Icons.add,
                                    size: 40, color: context.theme.grey,
                                  )
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Get.context!.theme.onFocus,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Text('email_address'.tr,
                                style: AppTextStyles.robotoCondensed(
                                  fontSize: 20,
                                  color: context.theme.mainTextColor
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            color: Get.context!.theme.onFocus,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              GetBuilder<ProfileParamsPageController>(
                                init: ProfileParamsPageController(),
                                builder: (controller) => Checkbox(
                                  value: controller.profile.legEnt,
                                  onChanged: (val) => controller.updateProfile(
                                      controller.profile..legEnt = val),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Flexible(
                                child: Text('this_profile_used_by'.tr,
                                  style: AppTextStyles.robotoCondensed(
                                    fontSize: 12,
                                    color: context.theme.mainTextColor
                                        .withOpacity(0.6),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Get.context!.theme.onFocus,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Text('work_place'.tr,
                                style: AppTextStyles.robotoCondensed(
                                  fontSize: 20,
                                  color: context.theme.mainTextColor
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Get.context!.theme.onFocus,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            children: [
                              Text('job_position'.tr,
                                style: AppTextStyles.robotoCondensed(
                                  fontSize: 20,
                                  color: context.theme.mainTextColor
                                      .withOpacity(0.6),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          height: 60,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 15.0),
                          decoration: BoxDecoration(
                            color: Get.context!.theme.onFocus,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('choose_language'.tr,
                                style: AppTextStyles.robotoCondensed(
                                  fontSize: 20,
                                  color: context.theme.mainTextColor
                                      .withOpacity(0.6),
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.flag, size: 25, color: Colors.red),
                                  Icon(Icons.flag, size: 25, color: Colors.green),
                                  Icon(Icons.flag, size: 25, color: Colors.blue),
                                  Icon(Icons.flag, size: 25, color: Colors.amber),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: widgets.currencyAndCityWidget(),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text('fill_information_request'.tr,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.mPlusRounded1c(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: context.theme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text('i_have_a_child'.tr + ':',
                            style: AppTextStyles.robotoCondensed(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customCheckBox(value: true, text: 'boy'.tr),
                            Text('22  декабря 2005',
                              style: AppTextStyles.robotoCondensed(
                                fontSize: 18,
                                color: context.theme.mainTextColor.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: context.theme.mainTextColor)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            customCheckBox(value: true, text: 'Мальчик'.tr),
                            customCheckBox(value: true, text: 'girl'.tr),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          width: 190,
                          height: 50,
                          decoration: BoxDecoration(
                            color: context.theme.focus,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextFormField(
                            style: AppTextStyles.robotoCondensed(fontSize: 13.0),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(0),
                                counterText: '',
                                border: InputBorder.none,
                                hintText: 'birthday'.tr),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            onPressed: () {  },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add, size: 35, color: context.theme.grey),
                                const SizedBox(width: 10),
                                Text('add_child'.tr,
                                  style: AppTextStyles.robotoCondensed(
                                      color: context.theme.primary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GetBuilder<ProfileParamsPageController>(
                      init: ProfileParamsPageController(),
                      builder: (controller) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Text('i_have'.tr + ':',
                              style: AppTextStyles.robotoCondensed(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasVehicle('car'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasVehicle('car', value)),
                                      text: 'Автомобиль')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasVehicle('scooter'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasVehicle('scooter', value)),
                                      text: 'Скутер')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasVehicle('motorcycle'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasVehicle('motorcycle', value)),
                                      text: 'Мотоцикл')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasVehicle('bicycle'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasVehicle('bicycle', value)),
                                      text: 'Велосипед')),
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextFormField(
                                enabled: controller.hasVehicle('car'),
                                style: AppTextStyles.robotoCondensed(),
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Указать VIN автомобиля'
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Мои увлечения:',
                              style: AppTextStyles.robotoCondensed(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('sport'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('sport', value)),
                                      text: 'Спорт')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('tourism'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('tourism', value)),
                                      text: 'Туризм')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('auto'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('auto', value)),
                                      text: 'Автомобили')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('hunting'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('hunting', value)),
                                      text: 'Охота')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('garden'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('garden', value)),
                                      text: 'Сад и огород')),
                                  Flexible(child: customCheckBox(value: true, text: 'Строительство')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('health'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('health', value)),
                                      text: 'Здоровье')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hobby('electronics'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasHobby('electronics', value)),
                                      text: 'Электроника')),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Мои питомцы, животные:',
                              style: AppTextStyles.robotoCondensed(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('dog'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('dog', value)),
                                      text: 'Собака')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('cat'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('cat', value)),
                                      text: 'Кот')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('fish'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('fish', value)),
                                      text: 'Рыбки')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('bird'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('bird', value)),
                                      text: 'Птица')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('lizard'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('lizard', value)),
                                      text: 'Рептилия')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('mouse'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('mouse', value)),
                                      text: 'Грызун')),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                children: [
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('horse'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('horse', value)),
                                      text: 'Лошадь')),
                                  Flexible(child: customCheckBox(
                                      value: controller.hasPet('ships'),
                                      onChanged: (value) => controller.updateProfile(
                                          controller.profile.changeHasPets('ships', value)),
                                      text: 'Бараны и ')),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Divider(),
                  const SizedBox(height: 20),
                  TextButton(
                      onPressed: () { controller.logout(); },
                      child: Text('exit_profile'.tr,
                        style: AppTextStyles.robotoCondensed(
                            color: context.theme.primary),
                      ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customCheckBox({
    bool? value,
    Function(bool? value)? onChanged,
    required String text,
    Color? textColor}) {
    return Row(
      children: [
        SizedBox(
            height: 20,
            width: 20,
            child: Checkbox(value: value, onChanged: onChanged),
        ),
        const SizedBox(width: 10),
        Text(text,
          style: AppTextStyles.robotoCondensed(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: textColor,
          ),
        )
      ],
    );
  }
}