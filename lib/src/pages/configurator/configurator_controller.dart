import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:maxkgapp/src/models/configurator.dart';
import 'package:maxkgapp/src/models/configurator_selected.dart';

class ConfiguratorController extends GetxController {
  List<Configurator>? confList;

  RxBool isLoaded = false.obs;

  RxList<ConfiguratorSelected> configuratorSelected = <ConfiguratorSelected>[
    for (int i = 0; i < 26; i++)
      ConfiguratorSelected(title: "", price: 0, index: i),
  ].obs;

  void resetConfigureted() {
    for (int i = 0; i < 26; i++) configuratorSelected[i].title = "";

    configuratorSelected.refresh();
  }

  @override
  void onInit() {
    print("начал");
    getData();
  }

  getData() async {
    String path = 'assets/configurator.json';
    String jobsString = await rootBundle.loadString(path);
    confList = await configuratorFromJson(jobsString)
        .where((element) => element.category < 5)
        .toList();

    if (confList != null) {
      isLoaded.value = true;
    }
  }
}
