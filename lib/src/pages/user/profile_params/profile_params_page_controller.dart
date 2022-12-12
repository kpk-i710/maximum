import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../../models/profile.dart';
import '../../../models/user.dart';
import '../../../helpers/prefs.dart';

class ProfileParamsPageController extends GetxController {
  RxInt selectedRadio = 0.obs;

  void change(int index){
    selectedRadio.value = index;

  }

  RxString selectedLang = "flag_ru".obs;

  RxInt selectedTheme = 0.obs;

  List<String> languageIcons = [
    'flag_kg',
    "flag_ru",
    "flag_uz",
  ].obs;

  void logout() {
    Prefs.isLogin = false;
    Get.back();
  }

  User get user => Prefs.user;

  Profile get profile => Prefs.user.profile!;

  updateProfile(Profile profile) {
    Prefs.user.profile = profile;
    update();
  }

  bool hasVehicle(String key) =>
      profile.vehicles![key] != null && profile.vehicles![key]!;

  bool hobby(String key) =>
      profile.hobbies![key] != null && profile.hobbies![key]!;

  bool hasPet(String key) => profile.pets![key] != null && profile.pets![key]!;
}
