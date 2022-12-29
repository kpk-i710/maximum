import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../../models/profile.dart';
import '../../../models/user.dart';
import '../../../helpers/prefs.dart';

class ProfileParamsPageController extends GetxController {
  RxInt selectedRadio = 0.obs;

  void change(int index) {
    selectedRadio.value = index;
  }

  @override
  void onInit() {
    if (Prefs.selectedLang != null) {
      selectedLang.value = Prefs.selectedLang;
    }
    // TODO: implement onInit
    super.onInit();
  }

  RxString selectedLang = "ru".obs;

  RxInt selectedTheme = 0.obs;

  List<String> languageIcons = [
    'en',
    'kg',
    "ru",
    "uz",
  ].obs;

  void changeLang() {
    var locale = Locale(selectedLang.value, selectedLang.value.toUpperCase());
    Prefs.selectedLang = selectedLang.value;
    Get.updateLocale(locale);
  }

  void logout() {
    Prefs.isLogin = false;
    Get.back();
  }

  User get user => Prefs.user;

  Profile get profile => Prefs.user.profile!;

  void tabSelect(int index) => Helper.tabSelect(index);

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
