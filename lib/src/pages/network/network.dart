import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:maxkgapp/src/pages/network/network_controller.dart';
import 'package:maxkgapp/src/widgets/search_widgets/search_bar_2.dart';
import 'package:maxkgapp/src/widgets/widgets_controller.dart';
import '../../widgets/widgets.dart' as widgets;

class NetWork extends ConsumerWidget {
  NetWork({Key? key}) : super(key: key);

  final netWorkController = Get.put(NetWorkController());

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: SearchBar2(
              title: "something_wrong_internet".tr,
            ),
            bottomNavigationBar: widgets.newBottomNavigation(
              currentTab: 0,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "something_wrong_internet".tr,
                    style: widgets.robotoConsid(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "check_mobile_connection".tr,
                    textAlign: TextAlign.center,
                    style: widgets.robotoConsid(),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
                    child: widgets.noInternetButton(
                        hight: 30,
                        text: 'update'.tr,
                        fontSize: 12,
                        onPressed: () {}),
                  ),
                ],
              ),
            )));
  }
}
