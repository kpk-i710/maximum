import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helpers/prefs.dart';
import '../../styles.dart';
import 'filter_page_controller.dart';

class FilterPage extends StatelessWidget {
  final c = Get.put(FilterPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: InkWell(
            onTap: () {
              print('back');
              Get.back(result: 'result');
            },
            child: Icon(Icons.close, color: Colors.blue)),
        title: Text(
          'filters'.tr,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () => c.reset(),
            child: Center(
              child: Text('reset'.tr.toUpperCase(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 18, 8, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('price'.tr,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                children: [
                  Obx(() => Expanded(
                    flex: 1,
                    child: TextField(
                      controller: c.priceStartCont.value,
                      keyboardType: TextInputType.number,
                      onChanged: c.onStartPriceChanged,
                      decoration: InputDecoration(
                        prefixIcon: Container(
                            width: 5,
                            child: Center(
                              child: Text('from'.tr,
                                  style: TextStyle(
                                      color: Colors.grey.shade800)),
                            )),
                        suffixIcon: Container(
                            width: 5,
                            child: Center(
                              child: Text(Prefs.defaultCurrency,
                                  style: TextStyle(
                                      color: Colors.grey.shade500)),
                            )),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                width: 0.5, color: Colors.grey.shade500)),
                        hintText: c.ranges.value.start.toString(),
                      ),
                    ),
                  )),
                  SizedBox(width: 10),
                  Obx(() => Expanded(
                    flex: 1,
                    child: TextField(
                      controller: c.priceEndCont.value,
                      keyboardType: TextInputType.number,
                      onChanged: c.onEndPriceChanged,
                      decoration: InputDecoration(
                        prefixIcon: Container(
                            width: 5,
                            child: Center(
                              child: Text('to'.tr,
                                  style: TextStyle(
                                      color: Colors.grey.shade500)),
                            )),
                        suffixIcon: Container(
                            width: 5,
                            child: Center(
                              child: Text(Prefs.defaultCurrency,
                                  style: TextStyle(
                                      color: Colors.grey.shade500),
                              ),
                            )),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide(
                                width: 0.5, color: Colors.grey.shade400)),
                        hintText: c.ranges.value.end.toString(),
                      ),
                    ),
                  )),
                ],
              ),
              SizedBox(height: 15),
              Obx(() => RangeSlider(
                  max: 10000,
                  min: 0,
                  activeColor: context.theme.primary,
                  values: c.ranges.value,
                  onChanged: (val) {
                    c.changeRanges(val);
                  })),
              SizedBox(height: 10),
              Obx(() => Container(
                height: 35,
                child: Row(
                  children: [
                    Checkbox(
                        value: c.getTodayCheck.value,
                        onChanged: (val) {
                          c.getTodayCheck.value = val!;
                        }),
                    SizedBox(width: 5),
                    Text('get_today'.tr,
                        style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              )),
              Obx(() => Container(
                height: 35,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        value: c.bestPriceCheck.value,
                        onChanged: (val) {
                          c.bestPriceCheck.value = val!;
                        }),
                    SizedBox(width: 5),
                    Text('best_price_guaranteed'.tr,
                        style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )),
              Obx(() => Container(
                height: 35,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        value: c.cashb.value,
                        onChanged: (val) {
                          c.cashb.value = val!;
                        }),
                    SizedBox(width: 5),
                    Text('increased_cashback'.tr,
                        style: TextStyle(fontWeight: FontWeight.w500))
                  ],
                ),
              )),
              ListTile(
                onTap: () {},
                leading: Text('brand'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                leading: Text('rating_by_reviews'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                leading: Text('seller'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                leading: Text('filler_type'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                leading: Text('filler_features'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {},
                leading: Text('smell'.tr,
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: context.theme.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0)),
                  ),
                  onPressed: () {
                    Get.back(result: 'result');
                  },
                  child: Text(
                    'show_count_of_products'.trParams({'count': '0', 'of': '0'})!
                        .toUpperCase(),
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}