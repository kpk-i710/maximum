import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:maxkgapp/src/styles.dart';
import '../../widgets/widgets.dart' as widgets;
import 'before_payment_delivry/before_payment_delivry.dart';
import 'shopping_cart_page_controller.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  final controller = Get.put(ShoppingCartPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                widgets.dark(

                    child: Container(
                        width: double.infinity,
                        height: 50,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Корзина #12543",
                              style: widgets.robotoConsid(
                                  color: Colors.white, fontSize: 18),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                widgets.citySelectorSheetAppBar(
                                    context: context);
                              },
                              child: Container(
                                height: 50,
                                color: Colors.transparent,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    widgets.underLineDashed(
                                      color: Colors.white,
                                      child: Text(
                                        controller.selectedCity.value ??
                                            "your_city".tr,
                                        style: widgets.robotoConsid(
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: productWidgetWithCount(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: productWidgetWithCount(additionalService: false),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: productWidgetWithCount(assemblyServices: true),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, right: 15, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF6F6F6),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 35.0, horizontal: 25),
                      child: Container(
                        child: Column(
                          children: [
                            widgets.rowText(
                                text1: 'Товары, 1 шт.', text2: '119 990 с.'),
                            widgets.rowText(
                                text1: 'Скидка', text2: '10 800 с.'),
                            controller.checkForServices()
                                ? widgets.rowText(
                                    text1: 'Услуги', text2: '500 с.')
                                : SizedBox(),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text("Итого:",
                                    style: widgets.robotoConsid(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                                Flexible(
                                  child: Container(
                                    height: 15,
                                    width: Get.width,
                                    decoration: DottedDecoration(
                                        color: AppTextStyles.colorBlackMy,
                                        shape: Shape.line,
                                        dash: [2, 2]),
                                  ),
                                ),
                                Text("109 190 с.",
                                    style: widgets.robotoConsid(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            widgets.orderButton(
                                text: 'continue_checkout'.tr.toUpperCase(),
                                fontSize: 14,
                                onPressed: () {
                                  controller.selectedCity.value == null
                                      ? widgets.citySelectorSheetWithQuestion(
                                          context: context)
                                      : Get.to(BeforePaymentDelivry());
                                })
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget productWidgetWithCount(
      {bool additionalService = true, bool assemblyServices = false}) {
    return Obx(() {
      return widgets.boxShadows(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset('assets/images/notebook_item.png',
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'expample_card6'.tr,
                        style: widgets.robotoConsid(color: Color(0xff62656A)),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            '2000 с',
                            style: widgets.robotoConsid(
                                color: Color(0xff494949),
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 10),
                          Text(
                            '3 200 сом',
                            style: widgets.robotoConsid(
                              color: Color(0xff62656A),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Color(0xffF6F6F6),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "кол-во: 50 шт.= 10 000 с.",
                          style: widgets.robotoConsid(color: Color(0xff70757A)),
                        ),
                      ),
                      SizedBox(height: 7),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              buttonCounter(
                                  text: "-",
                                  onTap: () {
                                    controller.minus();
                                  }),
                              Container(
                                width: 40,
                                child: Center(
                                  child: Text(
                                    controller.counter.value.toString(),
                                    style: widgets.robotoConsid(
                                        fontWeight: FontWeight.w100,
                                        color: Color(0xff494949),
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                              buttonCounter(
                                  text: "+",
                                  onTap: () {
                                    controller.plus();
                                  }),
                            ],
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          widgets.addFavorite(),
                          SizedBox(
                            width: 4,
                          ),
                          widgets.IconBattonSvg(sizeButton: 35),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 38,
                          ),
                          Text(
                            'по 10 шт.',
                            style: widgets.robotoConsid(
                                color: Color(0xff62656A),
                                fontWeight: FontWeight.w100,
                                fontSize: 10),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(width: 2),
                          widgets.anySvg(nameSvg: 'car_blue'),
                          SizedBox(width: 10),
                          Flexible(
                            child: Text("when_coming_delivry".tr,
                                maxLines: 2,
                                style: widgets.robotoConsid(
                                    color: AppTextStyles.colorBlueMy,
                                    fontSize: 10)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            additionalService
                ? ListTileTheme(
                    contentPadding: EdgeInsets.all(0),
                    child: Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        onExpansionChanged: (bool expanded) {
                          controller.demoList[1] = !expanded;
                        },
                        collapsedBackgroundColor: Colors.white,
                        backgroundColor: Colors.white,
                        trailing: Text(
                          controller.checkForServices()? "500 с.": "0 с",
                          style:
                              widgets.robotoConsid(fontWeight: FontWeight.bold),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            widgets.underLineDashed(
                                child: Text(
                                  "additional_services".tr,
                                  style: widgets.robotoConsid(
                                      color: Color(0xff142A65)),
                                ),
                                hight: 3),
                            SizedBox(width: 6),
                            controller.demoList[1]
                                ? Icon(
                                    Icons.arrow_forward_ios,
                                    color: Color(0xff142A65),
                                    size: 13,
                                  )
                                : widgets.anySvg(
                                    nameSvg: "arrow_down", size: Size(7, 7)),
                            Spacer(),
                          ],
                        ),
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "assembly_services".tr,
                                style: widgets.robotoConsid(
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              selectCheckBox(
                                  text: 'Теннисный стол Хобби',
                                  index: 0,
                                  price: '500 с.'),
                              selectCheckBox(
                                  text: 'Теннисный стол Хобби',
                                  index: 1,
                                  price: '200 с.'),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      );
    });
  }

  Widget selectCheckBox({
    required String text,
    required int index,
    required String price,
  }) {
    return Obx(() {
      return Theme(
        data: ThemeData(toggleableActiveColor: AppTextStyles.colorBlueMy),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.changeBoxList(index: index);
              },
              child: Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                      child: Checkbox(
                        checkColor: Colors.white,
                        value: controller.checkBoxList[index].isSelected,
                        onChanged: (newValue) {
                          controller.changeBoxList(index: index);
                        },
                      ),
                    ),
                    SizedBox(width: 15),
                    Flexible(
                      child: SizedBox(
                        width: Get.width - 100,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          "$text",
                          style: controller.checkBoxList[index].isSelected
                              ? widgets.robotoConsid(
                                  color: AppTextStyles.colorBlueMy)
                              : widgets.robotoConsid(color: Color(0xff727272)),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "$price",
                      style: widgets.robotoConsid(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buttonCounter({
    required String text,
    required Function() onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Color(0xffCCCCCC),
              width: 1,
            )),
        width: 35,
        height: 35,
        child: Center(
          child: Text(
            text,
            style: widgets.robotoConsid(color: Color(0xff0C54A1), fontSize: 20),
          ),
        ),
      ),
    );
  }
}
