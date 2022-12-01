import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 50.0, right: 23.0, top: 10),
                  child: ListTile(
                      title: Text(
                    exampleSearchString,
                    style: widgets.robotoConsid(fontSize: 12),
                  )),
                );
              }),
        ),
        SizedBox(
          height: Get.height / 2.7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text("show_all_results".tr,style: widgets.robotoConsid(),),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28.0, top: 41.0),
                child: Row(
                  children: [
                    Text("categories".tr,
                        style: widgets.robotoConsid(
                          fontSize: 24,
                        )),
                    SizedBox(width: 10),
                    Expanded(
                      child: Divider(
                        thickness: 4,
                        color: Color(0xffF5F5F5),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: exampleCategory.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 51.0, top: 10),
                      child: Text(exampleCategory[index]),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ],
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
