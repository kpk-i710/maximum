import 'package:get/get.dart';

import '../../../models/profile.dart';
import '../../../models/user.dart';
import '../../../helpers/prefs.dart';

class ProfileParamsPageController extends GetxController {

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

  bool hasVehicle(String key) => profile.vehicles![key] != null
      && profile.vehicles![key]!;
  bool hobby(String key) => profile.hobbies![key] != null && profile.hobbies![key]!;
  bool hasPet(String key) => profile.pets![key] != null && profile.pets![key]!;
}