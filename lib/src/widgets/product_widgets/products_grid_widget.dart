import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:maxkgapp/src/widgets/product_new_widgets/product_item_widget.dart';
import '../../helpers/helper.dart';
import '../../models/product.dart';
import '../../widgets/widgets.dart' as widgets;

class ProductsGridWidget extends StatelessWidget {
  final List<Product> list;

  const ProductsGridWidget({Key? key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: StaggeredGridView.countBuilder(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: list.isEmpty ? 4 : list.length,
        itemBuilder: (BuildContext context, int index) {
          return list.isEmpty
              ? Container(
                  height: 180,
                  margin: EdgeInsets.all(8.0),
                  child: widgets.blockPlaceholder())
              :ProductItemWidget() ;
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.fit(Helper.responsive(2, md: 1, lg: 1, xl: 1)),
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
      ),
    );
  }
}
