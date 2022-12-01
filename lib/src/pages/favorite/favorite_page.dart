import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/product_widgets/favorite_products_grid_widget.dart';
import '../../widgets/product_widgets/products_block_list_widget.dart';
import '../../widgets/product_widgets/products_list_widget.dart';
import '../../widgets/catalog_widgets/catalog_grid_widget.dart';
import '../../pages/favorite/favorite_page_controller.dart';
import '../../widgets/filter_widget.dart';
import '../../styles.dart';

class FavoritePage extends StatelessWidget {
  final c = Get.put(FavoritePageController());

  FavoritePage({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.background,
      appBar: AppBar(
        backgroundColor: context.theme.background,
        elevation: 0,
        title: Text('interesting'.tr,
            style: AppTextStyles.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400,
            ),
        ),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: c.onScrollNotification,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          controller: c.scrollController,
          child: Column(children: [
            FilterWidget(onFilterTap: () async {
              final res = await Get.toNamed('/filter');
            }, callBack: (type) {
              c.changeViewType(type);
            }),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Obx(() => CatalogGridWidget(
                    list: c.catalogList.value,

                  ),
              ),
            ),
            Obx(() => AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: c.productsViewType.value == 'grid'
                      ? FavoriteProductsGridWidget(
                          list: c.favoriteProductsList.value,
                          heroTag: 'favorite_product_')
                      : c.productsViewType.value == 'list'
                          ? ProductsListWidget(
                              key: UniqueKey(),
                              list: c.favoriteProductsList.value
                                  .map((e) => e.product)
                                  .toList(),
                              heroTag: 'product_list_')
                          : ProductsBlockListWidget(
                              key: UniqueKey(),
                              list: c.favoriteProductsList.value
                                  .map((e) => e.product)
                                  .toList(),
                              heroTag: 'product_block_'),
                ),
            ),
            const SizedBox(height: 20),
          ]),
        ),
      ),
    );
  }
}
