import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/catalog_widgets/catalog_list_item_widget.dart';
import '../../styles.dart';
import '../../pages/catalog/catalog_page_controller.dart';
import '../../widgets/search_widget_2/searchCatalogWidget.dart';
import '../../widgets/widgets.dart' as widgets;
import '../products_by_catalog/products_by_catalog_page_controller.dart';

class CatalogPage extends StatelessWidget {
  final bool bottomNavigation;
  final bool dialog;

  CatalogPage({Key? key, this.bottomNavigation = false, this.dialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      // appBar: AppBar(
      //   elevation: 1,
      //   backgroundColor: context.theme.background,
      //   automaticallyImplyLeading: false,
      //   centerTitle: true,
      //   title: Text('catalog'.tr,
      //     style: AppTextStyles.roboto(
      //       fontSize: 24,
      //     ),
      //   ),
      //   actions: [
      //     GetBuilder<CatalogPageController>(
      //       builder: (controller) {
      //         return IconButton(
      //           icon: Image.asset('assets/images/icon_left.png',
      //               color: context.theme.greyMedium),
      //           onPressed: () { controller.back(); },
      //         );
      //       }
      //     ),
      //   ],
      // ),
      bottomNavigationBar: bottomNavigation
          ? widgets.bottomNavigation(
              currentTab: 1,
              onSelectTab: (index) {
                if (dialog) {
                  if (index == 1) {
                    Get.back();
                    return;
                  }

                  Get.back(result: index);
                }
              })
          : null,
      body: SafeArea(
        child: GetBuilder<CatalogPageController>(
            init: CatalogPageController(),
            builder: (controller) {
              print('list size ${controller.catalogList.length}');
              return RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // if (!controller.home)
                        //   ...backToMainWidget(controller),
                        SizedBox(height: 20),
                        SearchCatalogWidget(),
                        SizedBox(height: 20),
                        Text(
                          "catalog".tr,
                          style:  widgets.robotoConsid(
                              fontSize: 23, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 20),
                        if (controller.histList.isNotEmpty)
                          for (int i = 0;
                              i < controller.histList.length - 1;
                              i++)
                            Column(
                              children: [
                                ListTile(
                                  leading: Icon(Icons.keyboard_arrow_left),
                                  title: Transform.translate(
                                    offset: Offset(-25, 0),
                                    child: Text(
                                        '${controller.histList[i].name}',
                                        style:  widgets.robotoConsid(fontSize: 16)),
                                  ),
                                  onTap: () {
                                    controller
                                        .openCatalog(controller.histList[i]);
                                  },
                                ),
                                divider(indent: 20, endIndent: 20),
                              ],
                            ),

                        // if (controller.histList.isNotEmpty)
                        //   Container(
                        //     width: double.infinity,
                        //     margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        //     padding: const EdgeInsets.symmetric(
                        //         vertical: 15.0, horizontal: 40.0),
                        //     decoration: BoxDecoration(
                        //       color: context.theme.primary,
                        //       borderRadius: BorderRadius.circular(8.0),
                        //     ),
                        //     child: Text(
                        //       '${controller.histList.last.name}',
                        //       style: AppTextStyles.mPlusRounded1c(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w400,
                        //         color: context.theme.onPrimary,
                        //       ),
                        //     ),
                        //   ),

                        for (int i = 0; i < controller.catalogList.length; i++)
                          Column(
                            children: [
                              CatalogListItemWidget(
                                catalog: controller.catalogList[i],
                                heroTag: 'catalog_',
                                onTap: () => controller
                                    .openCatalog(controller.catalogList[i]),
                              ),
                              Divider(endIndent: 30),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  List<Widget> backToMainWidget(CatalogPageController controller) => [
        ListTile(
          leading: Icon(Icons.keyboard_arrow_left),
          title: Transform.translate(
            offset: Offset(-25, 0),
            child: Text(
              'Главное меню',
              style:  widgets.robotoConsid(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          onTap: () => controller.backHome(),
        ),
        divider(indent: 20, endIndent: 20),
      ];

  Widget divider(
          {double indent = 0.0,
          double endIndent = 0.0,
          double thickness = 1,
          double verticalMargin = 2.5}) =>
      Container(
        height: thickness,
        margin: EdgeInsets.only(
            top: verticalMargin,
            bottom: verticalMargin,
            left: indent,
            right: endIndent),
        color: Get.context!.theme.greyWeak.withOpacity(0.70),
      );
}
