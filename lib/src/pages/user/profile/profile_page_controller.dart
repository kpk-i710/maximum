import 'package:get/get.dart';

import '../../../const/const.dart';
import '../../../helpers/prefs.dart';

class ProfilePageController extends GetxController {
  bool _isLogin = Prefs.isLogin;
  bool get isLogin => _isLogin;

  @override
  void onInit() {
    super.onInit();
    Prefs.listenKey(PrefsKeys.IS_LOGIN_KEY, (value) {
      _isLogin = value;
      update();
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
