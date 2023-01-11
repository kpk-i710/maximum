import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maxkgapp/src/models/configurator.dart';

import '../../helpers/data.dart' as data;
import 'package:localstorage/localstorage.dart';

class ConfiguratorController {
  saveList() async {
    final storage = LocalStorage('todo.json');
    await storage.setItem(
        "todo", json.encode(data.configuratorsData).toString());
  }
}

Future<List<Configurator>> fetchConfigurators() async {
  String? path;
  path = 'assets/configurator.json';
  String jobsString = await rootBundle.loadString(path);

  final storage = await LocalStorage('todo.json');
  await storage.ready;
  await Future.delayed(Duration(milliseconds: 400));
  if (await storage.getItem('todo') == null) {
    await storage.setItem('todo', jobsString);
  } else {
    jobsString = await storage.getItem('todo');
  }

  List<Configurator> confLists = await configuratorFromJson(jobsString)
      .where((element) => element.category < 5)
      .toList();
  if (data.configuratorsData.length == 1) {
    data.configuratorsData.clear();
    for (int i = 0; i < confLists.length; i++)
      data.configuratorsData.add(confLists[i]);
  }

  return data.configuratorsData
      .where((element) => element.category < 5)
      .toList();
}
