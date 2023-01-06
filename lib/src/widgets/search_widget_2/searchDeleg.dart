import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/between_pages_all/between_all_pages.dart';
import '../../widgets/widgets.dart' as widgets;

class searchDeleg extends SearchDelegate {
  String exampleSearchString =
      "Ноутбук Lenovo Ideapad S145-15API AMD 3020e4M Cache up to 2.6 GHzDDR4 4GB 120GB SSD15.6 Wi-Fi Bluetooth Web-камера Dos HDMI серый";

  List<String> exampleCategory = [
    "Ноутбуки",
    "Сумки для нотбуков",
    "Запчасти для ноутбуков",
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: IconButton(
            onPressed: () {
              // query = "";
            },
            icon: Icon(Icons.mic_none)),
      )
    ];
  }

  @override
  String get searchFieldLabel => 'i_am_looking_for'.tr;

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.microtask(() {
      Get.to(() => BetweenAllPages());
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "nothing_searched_yet".tr,
            style: widgets.robotoConsid(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            "find_interested_products".tr,
            style: widgets.robotoConsid(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
