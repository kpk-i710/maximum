import 'package:maxkgapp/src/models/multi_select.dart';

List<MultiSelect> fetchFilterCategory() {
  // await Future.delayed(Duration(milliseconds: 400));

  List<MultiSelect> list = [];
  if (list.length <7) list = ListTitles;

  print("опять применил");

  return list;
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
