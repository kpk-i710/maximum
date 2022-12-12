import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../../helpers/prefs.dart';
import '../../../../../widgets/widgets.dart' as widgets;
import '../../../shopping_cart_page_controller.dart';
import '../../before_payment_delivry_controller.dart';
import '../shipping_methods_controller.dart';
import 'add_adress/add_adress.dart';
import 'change_address_controller.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class ChangeAdress extends StatefulWidget {
  ChangeAdress({Key? key}) : super(key: key);

  @override
  State<ChangeAdress> createState() => _ChangeAdressState();
}

class _ChangeAdressState extends State<ChangeAdress> {
  final controller = Get.put(ChangeAdressController());
  final controllerCart = Get.put(ShoppingCartPageController());
  final controllerPaymentMethod = Get.put(BeforPaymentDevliryController());
  final controllerShippingMethods = Get.put(ShippingMethodsController());

  late YandexMapController controllerY;
  final Point _point = Point(latitude: 42.88, longitude: 74.60);
  final animationCamera =
      MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  @override
  Widget build(BuildContext context) {
    print("есть аргумент");
    print(Get.arguments);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          'change_address'.tr,
          style: widgets.robotoConsid(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: widgets.themeChangeAdress(
        child: Prefs.isLogin
            ? controller.isCourier(Get.arguments)
                ? controller.addressEnter.length > 0
                    ? pageLoginedSavedAdress()
                    : pageChangeAdgress()
                : pageChangeAdgress()
            : pageChangeAdgress(),
      ),
    );
  }

  Widget pageChangeAdgress() {
    final controller = Get.put(ChangeAdressController());
    final controllerShippingMethods = Get.put(ShippingMethodsController());
    final controllerPaymentMethod = Get.put(BeforPaymentDevliryController());
    final controllerCart = Get.put(ShoppingCartPageController());
    return Obx(() {
      return Stack(
        children: [
          YandexMap(
            mapObjects: controller.mapObjects.value,
            onMapCreated: (YandexMapController yandexMapController) async {
              controllerY = yandexMapController;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                widgets.wigetForNewUser(onTap: (item) async {
                  print(item);
                  controllerCart.selectedCity.value = item!;
                  await controllerY.moveCamera(
                      CameraUpdate.newCameraPosition(
                          CameraPosition(target: _point)),
                      animation: animationCamera);
                }),
                Spacer(),
                widgets.saveButton(
                    text: "save",
                    onPressed: () {
                      if (controller.checkAdress()) {
                        if (controllerShippingMethods.selectedPage.value == 0) {
                          controllerPaymentMethod
                              .isSelectedDelivryFreeMethod.value = true;
                        }
                        if (controllerShippingMethods.selectedPage.value == 1) {
                          controllerPaymentMethod
                              .isSelectedDelivryPayMethod.value = true;
                        }
                      }
                    }),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      );
    });
  }

  moveToBishkek() async {
    await Future.delayed(const Duration(seconds: 2), () async {
      if (ModalRoute.of(context)?.settings.name == "/ChangeAdress") {
        await controllerY.moveCamera(
            CameraUpdate.newCameraPosition(CameraPosition(target: _point)),
            animation: animationCamera);
      }
    });
  }

  Widget pageLoginedSavedAdress() {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            for (int i = 0; i < controller.addressEnter.length; i++)
              selectRadio(
                  text:
                      "${controllerCart.selectedCity.value} ${controllerCart.selectedStreetHouse ?? ""}",
                  index: i),
            SizedBox(height: 20),
            widgets.addAdressButton(
                text: 'add_address'.tr,
                onPressed: () {
                  Get.to(AddAdress());
                }),
            Spacer(),
            widgets.saveButton(
                text: "save",
                onPressed: () {
                  if (!controllerPaymentMethod
                      .isSelectedDelivryPayMethod.value) {
                    return;
                  }
                  Get.back();
                }),
            SizedBox(height: 20),
          ],
        ),
      );
    });
  }



  Widget selectRadio({required String text, required int index}) {
    final box = GetStorage();
    print("выбрано");
    print(box.read("selectedRadio"));
    if (box.read("selectedRadio") != null) {
      controller.selectedRadio.value = (box.read("selectedRadio"));
    }
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            widgets.boxShadows(
              padding: 4,
              child: Row(
                children: [
                  Flexible(
                    flex: 10,
                    child: GestureDetector(
                      onTap: () {
                        controller.change(index);

                        controllerPaymentMethod
                            .isSelectedDelivryPayMethod.value = true;

                        controllerCart.selectedStreetHouse.value = "ул. " +
                            controller.addressEnter[index].street +
                            " д." +
                            controller.addressEnter[index].house +
                            " кв." +
                            controller.addressEnter[index].apartament;

                        print("radio");
                        controller.change(index);

                        print(index);
                        final box = GetStorage();
                        box.write(
                            "selectedRadio", controller.selectedRadio.value);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  SizedBox(width: 10),
                                  Radio(
                                    activeColor: Color(0xff112B66),
                                    value: index,
                                    groupValue: controller.selectedRadio.value,
                                    onChanged: (int? value) {
                                      print("radio");
                                      controller.change(index);

                                      print(index);
                                      final box = GetStorage();
                                      box.write("selectedRadio",
                                          controller.selectedRadio.value);
                                    },
                                  ),
                                  SizedBox(width: 15),
                                  Flexible(
                                    child: Text(
                                      "$text",
                                      overflow: TextOverflow.ellipsis,
                                      style: widgets.robotoConsid(
                                          color: Color(0xff2C2D2E)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        controller.delateAdress(index);
                      },
                      child: Container(
                        color: Colors.transparent,
                        height: 50,
                        width: 50,
                        child: Center(child: widgets.anySvg(nameSvg: "trash")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
