import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../helpers/helper.dart';
import '../../models/product.dart';
import '../../widgets/product_widgets/product_list_item_widget.dart';

class ProductsListWidget extends StatelessWidget {
  final List<Product>? list;
  final String heroTag;
  final ScrollController? scrollController;
  final bool Function(ScrollNotification val)? onNotification;

  const ProductsListWidget({Key? key, required this.list,
    this.heroTag = 'product_list_', this.scrollController, this.onNotification});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: onNotification,
      child: StaggeredGridView.countBuilder(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: list!.length,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          return ProductListItemWidget(

            product: list!.elementAt(index),
          );
        },
        staggeredTileBuilder: (int index) =>
            new StaggeredTile.fit(Helper.responsive(4, lg: 2, xl: 2)),
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
    );
  }
}
