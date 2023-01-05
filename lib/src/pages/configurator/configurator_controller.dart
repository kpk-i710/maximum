import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:maxkgapp/src/models/configurator.dart';

class ConfiguratorController extends GetxController {

  List<Configurator>? confList;

  RxBool isLoaded = false.obs;
  RxInt currentIndex = 0.obs;


  @override
  void onInit() {
    print("начал");
    getData();
  }

  getData() async {
    String path = 'assets/configurator.json';
    String jobsString = await rootBundle.loadString(path);
    confList = await configuratorFromJson(jobsString)
        .where((element) => element.category <5)
        .toList();

    if (confList != null) {
      isLoaded.value = true;
    }
  }

}
