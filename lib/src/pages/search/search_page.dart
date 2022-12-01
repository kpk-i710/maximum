import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../const/speech_controller.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../widgets/product_widgets/products_block_list_widget.dart';
import '../../widgets/product_widgets/products_grid_widget.dart';
import '../../widgets/product_widgets/products_list_widget.dart';

import '../../widgets/widgets.dart' as widgets;
import '../../styles.dart';
import 'search_page_controller.dart';

class SearchPage extends StatelessWidget {
  final controller = Get.put(SearchPageController());
  final speechController = Get.put(SpeechController());

  @override
  Widget build(BuildContext context) {
    speechController.setListeners(onResult: (text) {
      controller.searchFieldController.text = text;
    });
    return Scaffold(
      backgroundColor: context.theme.background,
      appBar: AppBar(
        leading: null,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: context.theme.background,
        title: Container(
          height: kToolbarHeight,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(
              color: Colors.grey.withOpacity(0.15),
              width: 3,
            ),
          )),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: context.theme.grey,
                onPressed: () {},
              ),
              Expanded(
                child: Obx(() => TextField(
                      controller: controller.searchFieldController,
                      decoration: InputDecoration(
                        hintText: speechController.listening.value
                            ? 'speak'.tr
                            : 'i_am_looking_for'.tr,
                        labelStyle: AppTextStyles.roboto(fontSize: 18),
                        hintStyle: AppTextStyles.roboto(
                            fontSize: 18, color: context.theme.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (text) {
                        controller.search();
                      },
                    )),
              ),
              Obx(() => controller.searchTextObs.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        controller.searchFieldController.text = '';
                      },
                      icon: AppIcon(
                        AppIcons.cancel,
                        color: context.theme.mainTextColor,
                      ),
                    )
                  : Container()),
              VerticalDivider(
                  color: Colors.grey.withOpacity(0.15), width: 5, thickness: 3),
              IconButton(
                icon: Obx(() => speechController.listening.value
                    ? Icon(Icons.fiber_manual_record,
                        size: 34, color: context.theme.greyStrong)
                    : AppIcon(AppIcons.mic, size: 30)),
                onPressed: () {
                  if (speechController.isListening())
                    speechController.stopListening();
                  else
                    speechController.startListening();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: widgets.bottomNavigation(
          currentTab: 0, onSelectTab: controller.tabSelect),
      body: RefreshIndicator(
        onRefresh: controller.onRefresh,
        child: SingleChildScrollView(
          child: body(context),
        ),
      ),
    );
  }

  Widget body(BuildContext context) => Obx(() {
        if (controller.isLoading())
          return SizedBox(
            height: 80.0.h,
            child: Center(child: CircularProgressIndicator()),
          );

        if (controller.hasResults() && controller.showResults())
          return results();

        if (controller.searchTextObs.isEmpty) {
          if (controller.searchList.isNotEmpty) mySearchList(context);

          return nothingSearchedYet(context);
        }

        return nothingFound();
      });

  Widget results() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Obx(() => CatalogGridWidget(
                  list: controller.categoriesList.value,
                )),
            Obx(() => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1000),
                  child: controller.productsViewType.value == 'grid'
                      ? ProductsGridWidget(
                          list: controller.productsList.value,
                          key: UniqueKey(),
                        )
                      : controller.productsViewType.value == 'list'
                          ? ProductsListWidget(
                              key: UniqueKey(),
                              list: controller.productsList.value,
                              heroTag: 'product_list_')
                          : ProductsBlockListWidget(
                              key: UniqueKey(),
                              list: controller.productsList.value,
                              heroTag: 'product_block_'),
                )),
          ],
        ),
      );

  Widget nothingSearchedYet(BuildContext context) => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'nothing_searched_yet'.tr,
              style: AppTextStyles.roboto(fontSize: 24),
            ),
            Text(
              'find_interested_products'.tr,
              style: AppTextStyles.roboto(fontSize: 14),
            ),
            const SizedBox(height: 90),
            Image.asset('assets/images/not_searched_yet.png'),
            const SizedBox(height: 90),
          ],
        ),
      );

  Widget nothingFound() => Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              'nothing_found'.tr,
              style: AppTextStyles.roboto(fontSize: 24),
            ),
            const SizedBox(height: 15),
            Text(
              'try_clarify_your_request'.tr,
              style: AppTextStyles.roboto(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              height: 25,
              child: Text(
                'phone_number'.tr.toLowerCase(),
                style: AppTextStyles.roboto(fontSize: 12),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFc4c4c4),
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 25,
              child: Text('what_products_you_interested'.tr,
                  style: AppTextStyles.roboto(fontSize: 12)),
            ),
            TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xFFc4c4c4),
                filled: true,
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 25),
            widgets.bigFullWidthButton(
                text: 'send'.tr.toUpperCase(), onPressed: () {}),
            const SizedBox(height: 25),
            Image.asset('assets/images/nothing_found.png'),
            const SizedBox(height: 30),
          ],
        ),
      );

  Widget mySearchList(BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'you_looked_for'.tr,
                  style: AppTextStyles.robotoCondensed(fontSize: 24),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Divider(
                      thickness: 3,
                      color: context.theme.grey.withOpacity(0.15)),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'clear'.tr,
                    style: AppTextStyles.robotoCondensed(
                        fontSize: 24, color: context.theme.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            for (int i = 0; i < controller.searchList.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                margin: const EdgeInsets.only(bottom: 15),
                child: Text(
                  '${controller.searchList[i]}',
                  style: AppTextStyles.roboto(fontSize: 12),
                ),
              ),
          ],
        ),
      );

  Widget preResults(BuildContext context) => Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            for (int i = 0; i < controller.productsList.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                margin: const EdgeInsets.only(bottom: 15),
                child: Text(
                  '${controller.productsList[i].name}',
                  style: AppTextStyles.roboto(fontSize: 12),
                ),
              ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                controller.search();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppIcon(AppIcons.search, size: 30),
                  const SizedBox(width: 10),
                  Text(
                    'show_all_results'.tr,
                    style: AppTextStyles.robotoCondensed(fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'categories'.tr,
                        style: AppTextStyles.robotoCondensed(fontSize: 24),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Divider(
                            thickness: 3,
                            color: context.theme.grey.withOpacity(0.15)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  for (int i = 0; i < controller.categoriesList.length; i++)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Text(
                        '${controller.categoriesList[i].name}',
                        style: AppTextStyles.roboto(fontSize: 14),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      );
}
