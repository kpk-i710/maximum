import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/widgets/popular_categories/popular_categories_item.dart';

import '../../models/catalog.dart';
import '../../helpers/helper.dart';
import '../../widgets/widgets.dart' as widgets;
import '../catalog_widgets/catalog_item_widget.dart';

class PopularCategoriesGridWidget extends StatelessWidget {
  final List<Catalog> list;

  PopularCategoriesGridWidget({Key? key, required this.list}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 6,
        crossAxisSpacing: 13,
        mainAxisSpacing: 11,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return popular_categories_item(
            index: index,
          );
        },
        staggeredTileBuilder: (int index) {
          if (index == 0 || index == 5) {
            return StaggeredTile.extent(6, (1 / 2) * Get.width);
          }
          return StaggeredTile.extent(3, (1 / 2) * Get.width);
        });
  }
}
