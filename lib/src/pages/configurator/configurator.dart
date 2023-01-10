import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/models/configurator.dart';
import 'package:maxkgapp/src/pages/between_pages_all/between_all_pages.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;

bool isOne = true;

final configProvider =
    FutureProvider.autoDispose<List<Configurator>>((ref) async {
  await Future.delayed(Duration(milliseconds: 400));
  String? path;
  print("запрсо");
  if (isOne) {
    path = 'assets/configurator.json';
  } else {
    path = 'assets/configurator2.json';
  }
  isOne = !isOne;
  String jobsString = await rootBundle.loadString(path);

  List<Configurator> confLists = await configuratorFromJson(jobsString)
      .where((element) => element.category < 5)
      .toList();

  return confLists;
});

class Confugarator extends ConsumerStatefulWidget {
  Confugarator({Key? key}) : super(key: key);

  @override
  _ConfugaratorState createState() => _ConfugaratorState();
}

class _ConfugaratorState extends ConsumerState<Confugarator> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Configurator>> config = ref.watch(configProvider);
    return Scaffold(
        appBar: widgets.appBarJust(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            config.when(
              loading: () => Center(child: const CircularProgressIndicator()),
              error: (err, stack) => Text('Error: $err'),
              data: (config) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return Column(
                              children: [
                                systemBloc(),
                                mainItem(index: index, data: config),
                              ],
                            );
                          }

                          if (index == 10) {
                            return titleMain(
                                title: 'Переферийные устройства',
                                index: index,
                                data: config);
                          }

                          if (index == 20) {
                            return titleMain(
                                title: 'Дополнительные комплектующие',
                                index: index,
                                data: config);
                          }

                          if (index == 23) {
                            return titleMain(
                                title: 'Мебель', index: index, data: config);
                          }

                          return mainItem(index: index, data: config);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(height: 10);
                        },
                        itemCount: 10),
                  ),
                );
              },
            ),
          ],
        ));
  }

  Widget mainItem({required int index, required List<Configurator> data}) {
    return data[index].title != "Корпус"
        ? itemConfigurator(
            title: data[index].title,
            image: data[index].image,
            index: index,
          )
        : itemConfiguratorSelected(
            data: data,
            image: data[index].image,
            index: index,
          );
  }

  Widget titleMain(
      {required String title,
      required int index,
      required List<Configurator> data}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widgets.customButton(
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                child: Text(
                  "$title",
                  style: widgets.robotoConsid(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                color: AppTextStyles.colorGrayMy,
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        mainItem(index: index, data: data),
      ],
    );
  }

  Widget systemBloc() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Text(
                "Системный блок",
                style: widgets.robotoConsid(
                    fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5),
              Text(
                "*Обязательные комплектующие",
                style: widgets.robotoConsid(),
              ),
              SizedBox(height: 10),
            ],
          ),
          Spacer(),
          widgets.resetButton(onTap: () {
            print("Сбросить");
            setState(() {});
          })
        ],
      ),
    );
  }

  Widget itemConfigurator(
      {required String title, required String image, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          widgets.boxShadows(
            padding: 0,
            child: widgets.customButton(
              child: Container(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      image != ""
                          ? Image.asset(
                              'assets/images/config/$image.png',
                              width: 30,
                              height: 30,
                            )
                          : SizedBox(
                              width: 30,
                              height: 30,
                            ),
                      SizedBox(width: 10),
                      Text(
                        title,
                        style: widgets.robotoConsid(),
                      ),
                      Spacer(),
                      widgets.anySvg(nameSvg: 'select'),
                      SizedBox(width: 5),
                      Text(
                        "Выбрать",
                        style: widgets.robotoConsid(),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Get.to(
                  () => BetweenAllPages(
                      indexConfigurator: index,
                      fromConfigurator: true,
                      title: "title"),
                  arguments: {"idNews": "382"},
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget itemConfiguratorSelected(
      {required List<Configurator> data,
      required String image,
      required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          widgets.boxShadows(
              padding: 0,
              child: Container(
                height: 170,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          image != ""
                              ? Image.asset(
                                  'assets/images/config/$image.png',
                                  width: 30,
                                  height: 30,
                                )
                              : SizedBox(
                                  width: 30,
                                  height: 30,
                                ),
                          SizedBox(width: 10),
                          Text(
                            data[index].title,
                            style: widgets.robotoConsid(),
                          ),
                          Spacer(),
                          widgets.colorCustomButton(
                              color: AppTextStyles.colorGrayDividar,
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  child: Center(
                                      child: widgets.anySvg(nameSvg: 'trash'))),
                              onTap: () {
                                // controller.configuratorSelected[index].title =
                                //     "";
                                // controller.configuratorSelected.refresh();
                              }),
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Image.asset(
                                'assets/images/laptop.png',
                                width: 100,
                                height: 100,
                              ),
                              Positioned(
                                bottom: -10,
                                left: 0,
                                child: Container(
                                  width: 40,
                                  height: 20,
                                  child: Center(
                                      child: Text(
                                    "ХИТ",
                                    style: widgets.robotoConsid(
                                        color: Colors.white),
                                  )),
                                  decoration: BoxDecoration(
                                      color: AppTextStyles.colorBlueMy,
                                      borderRadius: BorderRadius.circular(2)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data[index].title,
                                  style: widgets.robotoConsid(fontSize: 12),
                                ),
                                SizedBox(height: 5),
                                Text("Код: 11400703",
                                    style: widgets.robotoConsid(
                                        fontSize: 12,
                                        color: AppTextStyles.colorBlueMy)),
                                SizedBox(height: 7),
                                Row(
                                  children: [
                                    Text(
                                      "${data[index].price}",
                                      style: widgets.robotoConsid(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                    widgets.strikeThrough(
                                      child: Text(
                                        "${data[index].price + 100}",
                                        style: widgets.robotoConsid(
                                            color: AppTextStyles.colorGrayMy),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
