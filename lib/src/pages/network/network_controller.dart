import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import '../../widgets/widgets.dart' as widgets;

class NetWorkController extends GetxController {

  void tabSelect(int index) => Helper.tabSelect(index);

  var isConnected = false.obs;
  final Connectivity connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void onInit() {
    _connectivitySubscription =
        connectivity.onConnectivityChanged.listen(_updateConnectionStatus);

    initConnectivity();
    super.onInit();
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult? result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult? result) {
    switch (result) {
      case ConnectivityResult.wifi:
        isConnected.value = true;
        Get.back();
        break;
      case ConnectivityResult.mobile:
        isConnected.value = true;
        Get.back();
        break;
      case ConnectivityResult.none:
        Get.toNamed(AppRouter.netWork);
        print("нет интернета");
        break;
      default:
        Get.snackbar("Ошибка интернета", "Не удается подключиться к интернету");
        break;
    }
  }
}
