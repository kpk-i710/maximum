import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/styles.dart';
import 'package:maxkgapp/src/widgets/bought_today/bought_today_grid_widget.dart';
import '../../widgets/widgets.dart' as widgets;
import 'before_payment_delivry/before_payment_delivry.dart';
import 'shopping_cart_page_controller.dart';

class ShoppingCartPage extends StatelessWidget {
  ShoppingCartPage({Key? key}) : super(key: key);

  final controller = Get.put(ShoppingCartPageController());
  final homeController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Prefs.counterCard > 0
              ? fullCard(context)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          height: Get.height / 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Коризна пуста",
                                style: widgets.robotoConsid(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 15),
                              Text(
                                "Воспользуйтесь каталогом или поиском для выбора товаров",
                                textAlign: TextAlign.center,
                                style: widgets.robotoConsid(),
                              ),
                              SizedBox(height: 15),
                              widgets.colorCustomButton(
                                  color: AppTextStyles.colorRedMy,
                                  width: Get.width,
                                  height: 50,
                                  child: Text(
                                    "Посмотреть каталог",
                                    style: widgets.robotoConsid(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onTap: () {}),
                              SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ),
                      widgets.twoList()
                    ],
                  ),
                )),
    );
  }

  Widget fullCard(BuildContext context) {
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
                        "cart".tr + " #12543",
                        style: widgets.robotoConsid(
                            color: Colors.white, fontSize: 18),
                      ),
                      Spacer(),
                      widgets.customButton(
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
                              widgets.underLineDashed(
                                color: Colors.white,
                                child: Text(
                                  controller.selectedCity.value ??
                                      "your_city".tr,
                                  style:
                                      widgets.robotoConsid(color: Colors.white),
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
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: widgets.productWidgetWithCount(context: context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: widgets.productWidgetWithCount(
                additionalService: false, context: context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
            child: widgets.productWidgetWithCount(context: context),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, right: 10, bottom: 20, top: 10),
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 35.0, horizontal: 10),
                child: Container(
                  child: Column(
                    children: [
                      widgets.rowText(
                          text1: 'Товары, 1 шт.', text2: '119 990 с'),
                      widgets.rowText(text1: 'Скидка', text2: '10 800 с'),
                      controller.checkForServices()
                          ? widgets.rowText(text1: 'Услуги', text2: '500 с')
                          : SizedBox(),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text("Итого:",
                              style: widgets.robotoConsid(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
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
                          Text("109 190 с",
                              style: widgets.robotoConsid(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
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
                          }),

                    ],
                  ),
                ),
              ),
            ),
          ),
          widgets.twoList()
        ],
      ),
    );
  }


}
