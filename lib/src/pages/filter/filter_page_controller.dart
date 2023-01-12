import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maxkgapp/src/models/multi_select.dart';



class filterNotifier extends StateNotifier<List<MultiSelect>> {
  void add(MultiSelect name) {
    state = [...state, name];
  }

  void remove(String name) {
    state = [...state.where((element) => element != name)];
  }

  void updateState(
      {required int index, required bool value, int category = 1}) {
    final updatedList = <MultiSelect>[];
    for (var i = 0; i < state.length; i++) {
      updatedList.add(state[i]);
    }
    updatedList
        .where((element) => element.category == category)
        .toList()[index]
        .isSelected = value;
    state = updatedList;
  }

  void resetListState({required bool value, int category = 1}) {
    final updatedList = <MultiSelect>[];
    for (var i = 0; i < state.length; i++) {
      updatedList.add(state[i]);
    }
    for (var i = 0; i < state.where((element) => element.category== category).toList().length; i++) {
      updatedList.where((element) => element.category== category).toList()[i].isSelected = false;
    }


    state = updatedList;
  }

  void resetAllListsState() {
    final updatedList = <MultiSelect>[];
    for (var i = 0; i < state.length; i++) {
      updatedList.add(state[i]);
      updatedList[i].isSelected = false;
    }

    state = updatedList;
  }

  filterNotifier() : super(ListTitles);
}

List<MultiSelect> ListTitles = [
  MultiSelect(title: 'Acer', category: 1),
  MultiSelect(title: 'Lenovo', category: 1),
  MultiSelect(title: 'Samsung', category: 1),
  MultiSelect(title: 'Nokia', category: 1),
  MultiSelect(title: 'Asus', category: 1),
  MultiSelect(title: 'Xiomi', category: 1),
  MultiSelect(title: 'LG', category: 1),
  MultiSelect(title: 'В течении часа', category: 2),
  MultiSelect(title: ' 1-2 дня', category: 2),
  MultiSelect(title: '10-14 дней', category: 2),
  MultiSelect(title: 'Есть', category: 3),
  MultiSelect(title: 'Нет', category: 3),
];
