import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';

import 'jsonBase.dart';
import 'package:flutter/services.dart';
import 'package:maxkgapp/src/models/configurator_selected.dart';
import 'package:localstore/localstore.dart';

class ApiService {
  var confList = <ConfiguratorSelected>[];

  Future<List<ConfiguratorSelected>> getData() async {
    if (Prefs.configuratorList != "") {
      await fetchListConfigurat();
    }

    if (Prefs.configuratorList == "") {
      String path = 'assets/configurator.json';
      String jobsString = await rootBundle.loadString(path);

      confList = await configuratorSelectedFromJson(jobsString)
          .where((element) => element.category < 5)
          .toList();
      saveInListConfigurat();
    }

    if (confList != null) {
      return confList;
    } else
      throw Exception("Не удалось загрузить данные");
  }

  Future<void> saveInListConfigurat() async {
    var configuratorList =
        confList.map((phoneList) => phoneList.toJson()).toList();
    String jsonString = jsonEncode(configuratorList);
    Prefs.configuratorList = jsonString;
  }

  Future<void> fetchListConfigurat() async {
    final box = GetStorage();

    if (Prefs.configuratorList != null) {
      var newConfiguratList = <ConfiguratorSelected>[];
      print("начал получать");
      final box = GetStorage();
      var result = box.read('configuratorList');
      List jsonData = jsonDecode(result);
      dynamic getValue = jsonData
          .map((adressList1) => ConfiguratorSelected.fromJson(adressList1))
          .toList();
      print("записанный адрес");
//newConfiguratList shoud be obs
      newConfiguratList = jsonData
          .map((payment) => ConfiguratorSelected.fromJson(payment))
          .toList();
      for (int i = 0; i < newConfiguratList.length; i++) {
        confList.add(newConfiguratList[i]);
        print(confList[i].title);
        print(confList[i].titleSelected);
      }
    }
  }
}
