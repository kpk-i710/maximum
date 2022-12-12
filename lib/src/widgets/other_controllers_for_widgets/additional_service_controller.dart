import 'package:get/get.dart';

import '../../models/checkBox.dart';

class AdditionlServiceController extends GetxController {
  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;
  final checkBoxList = <CheckBox>[
    CheckBox(price: '200', isSelected: false),
    CheckBox(price: '500', isSelected: false)
  ].obs;

  void changeBoxList({required int index}) {
    checkBoxList[index].isSelected = !checkBoxList[index].isSelected;
    checkBoxList.refresh();
  }

  bool checkForServices() {
    for (int i = 0; i < checkBoxList.length; i++) {
      if (checkBoxList[i].isSelected) {
        return true;
      }
    }
    return false;
  }
}
