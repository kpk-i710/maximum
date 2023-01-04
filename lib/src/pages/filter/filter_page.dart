import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../helpers/prefs.dart';
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
                  widgets.underLineDashed(
                    child: Text(
                      "reset".tr,
                      style: widgets.robotoConsid(
                          color: AppTextStyles.colorBlueMy, fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    10,
                    (index) => chooseButton(
                          index: index,
                          selectedIndex: controller.selectedBrend.value,
                          onTap: (bool value) {
                            if (value)
                              controller.selectedBrend.value = index;
                            else
                              controller.selectedBrend.value = 100;
                          },
                        )).toList(),
              ),
              SizedBox(height: 10),
              Text("delivery_terms".tr,
                  style: widgets.robotoConsid(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    3,
                    (index) => chooseButton(
                          selectedIndex: controller.selectedDelivery.value,
                          index: index,
                          text: controller.delivryTimeList[index],
                          onTap: (bool value) {
                            if (value)
                              controller.selectedDelivery.value = index;
                            else
                              controller.selectedDelivery.value = 100;
                          },
                        )).toList(),
              ),
              SizedBox(height: 10),
              Text("discounts".tr,
                  style: widgets.robotoConsid(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                    2,
                    (index) => chooseButton(
                          selectedIndex: controller.selectedDiscounts.value,
                          index: index,
                          text: controller.discountsList[index],
                          onTap: (bool value) {
                            if (value)
                              controller.selectedDiscounts.value = index;
                            else
                              controller.selectedDiscounts.value = 100;
                          },
                        )).toList(),
              ),
              Spacer(),
              widgets.saveButton(text: 'apply',onPressed: (){
                print("применить");
              }),
              SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
  }

  Widget chooseButton(
      {required int index,
      String text = "Acer",
      required int selectedIndex,
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
            if (index == selectedIndex)
              Icon(
                Icons.check,
                color: Colors.white,
                size: 12,
              ),
            SizedBox(width: 2),
            Text(
              text,
              style: TextStyle(
                  color: index == selectedIndex
                      ? Colors.white
                      : AppTextStyles.colorBlackMy),
            ),
          ],
        ),
        selected: index == selectedIndex ? true : false,
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
