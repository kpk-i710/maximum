import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:maxkgapp/src/models/configurator.dart';

import '../../helpers/data.dart' as data;
import 'package:localstorage/localstorage.dart';

class ConfiguratorController {
   saveList() async {
    final storage = LocalStorage('todo.json');
   await storage.setItem("todo", json.encode(data.configuratorsData).toString());
  }
}

Future<List<Configurator>> fetchUser(int configFirst) async {
  String? path;
  print("запрсо");
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
      .where((element) => element.category < configFirst)
      .toList();
  if (data.configuratorsData.length < 26) {
    for (int i = 2; i < confLists.length; i++)
      data.configuratorsData.add(confLists[i]);
  }

  return data.configuratorsData
      .where((element) => element.category < configFirst)
      .toList();
}
