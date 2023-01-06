import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/pages/between_pages_all/between_all_pages.dart';
import 'package:maxkgapp/src/pages/configurator/configurator_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;

class Confugarator extends StatelessWidget {
  Confugarator({Key? key}) : super(key: key);

  final controller = Get.put(ConfiguratorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: widgets.appBarJust(),
        body: Obx(() {
          return Column(
            children: [
              if (controller.isLoaded.value)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return Column(
                                children: [
                                  systemBloc(),
                                  mainItem(index: index),
                                ],
                              );
                            }

                            if (index == 10) {
                              return titleMain(
                                  title: 'Переферийные устройства',
                                  index: index);
                            }

                            if (index == 20) {
                              return titleMain(
                                  title: 'Дополнительные комплектующие',
                                  index: index);
                            }

                            if (index == 23) {
                              return titleMain(title: 'Мебель', index: index);
                            }

                            return mainItem(index: index);
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(height: 10);
                          },
                          itemCount: controller.configuratorSelected.length);
                    }),
                  ),
                ),
            ],
          );
        }));
  }

  Widget mainItem({required int index}) {
    return controller.configuratorSelected[index].title == ""
        ? itemConfigurator(
            title: controller.confList![index].title,
            image: controller.confList![index].image,
            index: index,
          )
        : itemConfiguratorSelected(
            title: controller.confList![index].title,
            image: controller.confList![index].image,
            index: index,
          );
  }

  Widget titleMain({required String title, required int index}) {
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
        mainItem(index: index)
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
            controller.resetConfigureted();
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
                    title: controller.confList![index].title,
                  ),
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
      {required String title, required String image, required int index}) {
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
                            title,
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
                                controller.configuratorSelected[index].title =
                                    "";
                                controller.configuratorSelected.refresh();
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
                                  controller.configuratorSelected[index].title,
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
                                      "${controller.configuratorSelected[index].price}",
                                      style: widgets.robotoConsid(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(width: 10),
                                    widgets.strikeThrough(
                                      child: Text(
                                        "${controller.configuratorSelected[index].price + 1000}",
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
