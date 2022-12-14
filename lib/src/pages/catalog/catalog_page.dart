import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/catalog_widgets/catalog_list_item_widget.dart';
import '../../styles.dart';
import '../../pages/catalog/catalog_page_controller.dart';
import '../../widgets/search_widget_2/searchCatalogWidget.dart';
import '../../widgets/widgets.dart' as widgets;

class CatalogPage extends StatelessWidget {
  final bool bottomNavigation;
  final bool dialog;

  CatalogPage({Key? key, this.bottomNavigation = false, this.dialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
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
              return RefreshIndicator(
                onRefresh: controller.onRefresh,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10),
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
                          style: widgets.robotoConsid(
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
                                        style:
                                            widgets.robotoConsid(fontSize: 16)),
                                  ),
                                  onTap: () {
                                    controller
                                        .openCatalog(controller.histList[i]);
                                  },
                                ),
                                divider(indent: 20, endIndent: 20),
                              ],
                            ),

                        for (int i = 0; i < controller.catalogList.length; i++)
                          Column(
                            children: [
                              CatalogListItemWidget(
                                catalog: controller.catalogList[i],
                                onTap: () => controller
                                    .openCatalog(controller.catalogList[i]),
                                index: i,
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
              '?????????????? ????????',
              style: widgets.robotoConsid(
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
