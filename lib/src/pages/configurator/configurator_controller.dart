import 'dart:convert';

import '../../helpers/data.dart' as data;
import 'package:localstorage/localstorage.dart';

class ConfiguratorController {
  saveList() {
    final storage = LocalStorage('todo.json');
    storage.setItem("todo", json.encode(data.configuratorsData).toString());
  }
}
