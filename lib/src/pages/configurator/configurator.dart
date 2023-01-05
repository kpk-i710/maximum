import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
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
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Column(
                          children: [
                            systemBloc(),
                            itemConfigurator(
                              title: controller.confList![index].title,
                              image: controller.confList![index].image,
                              index: index,
                            )
                          ],
                        );
                      }
                      if (index == 10) {
                        return titleMain(
                            title: 'Переферийные устройства', index: index);
                      }

                      if (index == 20) {
                        return titleMain(
                            title: 'Дополнительные комплектующие',
                            index: index);
                      }

                      if (index == 23) {
                        return titleMain(title: 'Мебель', index: index);
                      }
                      return itemConfigurator(
                        title: controller.confList![index].title,
                        image: controller.confList![index].image,
                        index: index,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 10);
                    },
                    itemCount: controller.confList!.length ?? 0,
                  ),
                ),
            ],
          );
        }));
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
        itemConfigurator(
          title: controller.confList![index].title,
          image: controller.confList![index].image,
          index: index,
        )
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
          })
        ],
      ),
    );
  }

  Widget itemConfigurator(
      {required String title, required String image, required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Obx(() {
        return Column(
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
                        Text("Выбрать"),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  controller.currentIndex.value = index;
                },
              ),
            ),
            AnimatedContainer(
                height: controller.currentIndex.value == index ? 500 : 0,
                color: AppTextStyles.colorGreyThrou,
                duration: Duration(seconds: 1))
          ],
        );
      }),
    );
  }
}
