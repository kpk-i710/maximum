import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../helpers/helper.dart';
import '../../models/product.dart';
import '../../widgets/product_widgets/product_block_item_widget.dart';

class ProductsBlockListWidget extends StatelessWidget {
  final List<Product>? list;
  final String heroTag;
  final ScrollController? scrollController;

  const ProductsBlockListWidget(
      {Key? key,
      required this.list,
      this.heroTag = 'product_block_item_',
      this.scrollController});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: list!.length,
      controller: scrollController,
      itemBuilder: (BuildContext context, int index) {
        return ProductBlockItemWidget(
            product: list!.elementAt(index), heroTag: heroTag);
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit(Helper.responsive(4, md: 2, lg: 2, xl: 2)),
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
    );
  }
}
