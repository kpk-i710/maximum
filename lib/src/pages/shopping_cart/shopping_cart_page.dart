import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
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
        child: SingleChildScrollView(
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
                              widgets.citySelectorSheetAppBar(context: context);
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
                                  Obx(() {
                                    return widgets.underLineDashed(
                                      color: Colors.white,
                                      child: Text(
                                        controller.selectedCity.value ??
                                            "your_city".tr,
                                        style: widgets.robotoConsid(
                                            color: Colors.white),
                                      ),
                                    );
                                  }),
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
              Row(
                children: [
                  SizedBox(width: 23),
                  widgets.underLineDashed(
                      child: Text(
                        "additional_services".tr,
                        style: widgets.robotoConsid(color: Color(0xff142A65)),
                      ),
                      hight: 3),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff142A65),
                    size: 13,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: productWidgetWithCount(),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: productWidgetWithCount(),
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
                          widgets.rowText(text1: 'Скидка', text2: '10 800 с.'),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                "Итого:",
                                style: widgets.robotoConsid(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                "109 190 с.",
                                style: widgets.robotoConsid(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          widgets.orderButton(
                              text: 'checkout1'.tr.toUpperCase(),
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
        ),
      ),
    );
  }

  Widget productWidgetWithCount() {
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
                      )
                    ],
                  ),
                ),
              ],
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
