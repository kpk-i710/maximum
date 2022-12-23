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

  final countAxis ;
  final double maxHeight ;
  final   itemCount ;
  PopularCategoriesGridWidget({Key? key, required this.list, required this.countAxis, required this.maxHeight,required this.itemCount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: GridView.count(
        childAspectRatio: 2 / 1.5,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        crossAxisCount: countAxis,
        children: List.generate(
            itemCount, (index) => popular_categories_item(index: index, onTap: () {  },)),

        primary: false,
        // shrinkWrap: true,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
// popular_categories_item
