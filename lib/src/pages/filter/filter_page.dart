import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/models/multi_select.dart';
import 'package:maxkgapp/src/styles.dart';
import 'filter_page_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class FilterPage extends StatelessWidget {
  final controller = Get.put(FilterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widgets.appBarFilter(),
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('price'.tr + ", сом",
                    style: widgets.robotoConsid(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Obx(() {
                  return Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: TextField(
                            controller: controller.priceStartCont,
                            onChanged: (val) {
                              controller.onStartPriceChanged(val);
                              controller.calculateCountFilter();
                            },
                            keyboardType: TextInputType.number,
                            decoration: decor(start: 'from')),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: TextField(
                            controller: controller.priceEndCont,
                            onChanged: (val) {
                              controller.onEndPriceChanged(val);
                              controller.calculateCountFilter();
                            },
                            keyboardType: TextInputType.number,
                            decoration: decor(start: 'to')),
                      ),
                    ],
                  );
                }),
                SizedBox(height: 20),
                Row(
                  children: [
                    Text("brand".tr,
                        style:
                            widgets.robotoConsid(fontWeight: FontWeight.bold)),
                    Spacer(),
                    if (controller.brandCounter.value > 0)
                      widgets.resetButton(onTap: () {
                        controller.resetBrend();
                      })
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                      controller.brandList.length,
                      (index) => chooseButton(
                            text: controller.brandList[index].title,
                            index: index,
                            baseList: controller.brandList.value,
                            onTap: (bool value) {
                              controller.brandList[index].isSelected = value;
                              controller.brandList.refresh();
                              controller.calculateCountFilter();
                            },
                          )).toList(),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("delivery_terms".tr,
                        style:
                            widgets.robotoConsid(fontWeight: FontWeight.bold)),
                    Spacer(),
                    if (controller.delivaryCounter.value > 0)
                      widgets.resetButton(onTap: () {
                        controller.resetDelivery();
                      })
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                      controller.delivryTimeList.length,
                      (index) => chooseButton(
                            baseList: controller.delivryTimeList,
                            index: index,
                            text: controller.delivryTimeList[index].title,
                            onTap: (bool value) {
                              controller.delivryTimeList[index].isSelected =
                                  value;
                              controller.delivryTimeList.refresh();
                              controller.calculateCountFilter();
                            },
                          )).toList(),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text("discounts".tr,
                        style:
                            widgets.robotoConsid(fontWeight: FontWeight.bold)),
                    Spacer(),
                    if (controller.discountCounter.value > 0)
                      widgets.resetButton(onTap: () {
                        controller.resetDiscount();
                      })
                  ],
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                      controller.discountsList.length,
                      (index) => chooseButton(
                            baseList: controller.discountsList,
                            index: index,
                            text: controller.discountsList[index].title,
                            onTap: (bool value) {
                              controller.discountsList[index].isSelected =
                                  value;
                              controller.discountsList.refresh();
                              controller.calculateCountFilter();
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
            );
          })),
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
      hintText: controller.ranges.value.start.toString(),
    );
  }
}
