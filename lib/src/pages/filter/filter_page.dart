import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/multi_select.dart';
import 'package:maxkgapp/src/pages/filter/filter_page_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;

final filterProvider =
    StateNotifierProvider<filterNotifier, List<MultiSelect>>((ref) {
  return filterNotifier();
});

final filtedCounter = StateProvider<int>((ref) {
  return 0;
});

final startPrice = StateProvider<String>((ref) {
  return "";
});

final endPrice = StateProvider<String>((ref) {
  return "";
});

final isSearchedProvider = StateProvider.autoDispose<bool>((ref) => false);

class FilterPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends ConsumerState<FilterPage> {
  late TextEditingController priceStartCont;

  late TextEditingController priceEndCont;

  @override
  void initState() {
    priceStartCont = TextEditingController();
    priceEndCont = TextEditingController();
    priceStartCont.text = ref.read(startPrice);
    priceEndCont.text = ref.read(endPrice);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filterList = ref.watch(filterProvider);

    final brandList =
        filterList.where((element) => element.category == 1).toList();
    final delivryList =
        filterList.where((element) => element.category == 2).toList();
    final discountList =
        filterList.where((element) => element.category == 3).toList();

    return Scaffold(
      appBar: widgets.appBarFilter(onTap: () {
        resetAllLists(ref: ref);
      }),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('price'.tr + ", сом",
                  style: widgets.robotoConsid(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: priceStartCont,
                        onChanged: (val) {
                          ref.read(startPrice.notifier).state = val;
                          calculate(ref: ref);
                        },
                        keyboardType: TextInputType.number,
                        decoration: decor(start: 'from')),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: TextField(
                        controller: priceEndCont,
                        onChanged: (val) {
                          ref.read(endPrice.notifier).state = val;
                          print(ref.read(endPrice.notifier).state);
                          calculate(ref: ref);
                        },
                        keyboardType: TextInputType.number,
                        decoration: decor(start: 'to')),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text("brand".tr,
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold)),
                  Spacer(),
                  if (filterList
                          .where((element) =>
                              element.isSelected == true &&
                              element.category == 1)
                          .length >
                      0)
                    widgets.resetButton(onTap: () {
                      resetList(indexCategory: 1, ref: ref);
                    })
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    brandList.length,
                    (index) => chooseButton(
                          text: "${brandList[index].title}",
                          index: index,
                          baseList: brandList,
                          onTap: (bool value) {
                            selectItemFilter(
                                ref: ref, value: value, index: index);
                          },
                        )).toList(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("delivery_terms".tr,
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold)),
                  Spacer(),
                  if (filterList
                          .where((element) =>
                              element.isSelected == true &&
                              element.category == 2)
                          .length >
                      0)
                    widgets.resetButton(onTap: () {
                      resetList(indexCategory: 2, ref: ref);
                    })
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    delivryList.length,
                    (index) => chooseButton(
                          text: "${delivryList[index].title}",
                          index: index,
                          baseList: delivryList,
                          onTap: (bool value) {
                            selectItemFilter(
                                ref: ref,
                                value: value,
                                index: index,
                                category: 2);
                          },
                        )).toList(),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text("discounts".tr,
                      style: widgets.robotoConsid(fontWeight: FontWeight.bold)),
                  Spacer(),
                  if (filterList
                          .where((element) =>
                              element.isSelected == true &&
                              element.category == 3)
                          .length >
                      0)
                    widgets.resetButton(onTap: () {
                      resetList(indexCategory: 3, ref: ref);
                    })
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    discountList.length,
                    (index) => chooseButton(
                          text: "${discountList[index].title}",
                          index: index,
                          baseList: discountList,
                          onTap: (bool value) {
                            selectItemFilter(
                                ref: ref,
                                value: value,
                                index: index,
                                category: 3);
                          },
                        )).toList(),
              ),
              Spacer(),
              widgets.saveButton(
                  text: 'apply',
                  onPressed: () {
                    print("применить");
                    Get.back();
                  }),
              SizedBox(height: 20),
            ],
          )),
    );
  }

  Widget chooseButton(
      {required int index,
      String text = "Acer",
      required List<MultiSelect> baseList,
      required Function(bool value) onTap}) {
    return ChoiceChip(
        padding: EdgeInsets.all(0),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        selectedColor: AppTextStyles.colorBlueMy,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        label: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (baseList[index].isSelected)
              Icon(
                Icons.check,
                color: Colors.white,
                size: 12,
              ),
            SizedBox(width: 2),
            Text(
              text,
              style: TextStyle(
                  color: baseList[index].isSelected
                      ? Colors.white
                      : AppTextStyles.colorBlackMy),
            ),
          ],
        ),
        selected: baseList[index].isSelected,
        onSelected: onTap);
  }

  InputDecoration decor({required String start}) {
    return InputDecoration(
      filled: true,
      fillColor: AppTextStyles.colorGrayDividar,
      prefixIcon: Container(
          width: 5,
          child: Center(
            child: Text('$start'.tr,
                style: widgets.robotoConsid(color: AppTextStyles.colorGrayMy)),
          )),
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(width: 3, color: Colors.transparent), //<-- SEE HERE
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(width: 1, color: Colors.transparent)),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(color: AppTextStyles.colorBlueMy, width: 1.0),
        borderRadius: BorderRadius.circular(5.0),
      ),
      hintText: "0",
    );
  }

  void selectItemFilter(
      {required WidgetRef ref,
      required int index,
      required bool value,
      int category = 1}) {
    ref
        .read(filterProvider.notifier)
        .updateState(index: index, value: value, category: category);

    calculate(ref: ref);
  }

  void resetList({int indexCategory = 1, required WidgetRef ref}) {
    ref
        .read(filterProvider.notifier)
        .resetListState(value: false, category: indexCategory);
    calculate(ref: ref);
  }

  void resetAllLists({required WidgetRef ref}) {
    ref.read(filterProvider.notifier).resetAllListsState();
    priceEndCont.text = "";
    priceStartCont.text = "";
    ref.read(startPrice.notifier).state = "";
    ref.read(endPrice.notifier).state = "";
    calculate(ref: ref);
  }

  void calculate({required WidgetRef ref}) {
    ref.read(filtedCounter.notifier).state =
        ListTitles.where((element) => element.isSelected == true)
            .toList()
            .length;
    if (priceStartCont.text.length > 0)
      ref.read(filtedCounter.notifier).state++;
    if (priceEndCont.text.length > 0) ref.read(filtedCounter.notifier).state++;
  }
}
