import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/instance_manager.dart';
import '../../helpers/app_router.dart';
import '../../widgets/search_widgets/search_bar_2.dart';
import '../../widgets/widgets.dart' as widgets;
import 'all_promotions_controller.dart';

class AllPromotionsPage extends StatelessWidget {
  const AllPromotionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final allPromotionsController = Get.put(AllPromotionsController());
    return Scaffold(
      appBar: SearchBar2(title: "promotions".tr),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: allPromotionsController.tabSelect),
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.builder(
            itemCount: allPromotionsController.promotionsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRouter.betweenAllPage,
                      arguments: {
                        "idNews":
                            allPromotionsController.promotionsList[index].id,
                      },
                    );
                  },
                  child: widgets.DiscountItemWidget(allPromotionsController
                          .promotionsList[index].logoUrl!)
                      .marginOnly(bottom: 20),
                ),
              );
            }),
      ),
    );
  }
}
