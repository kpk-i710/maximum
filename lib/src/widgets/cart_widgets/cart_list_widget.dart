import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/cart.dart';
import '../../widgets/cart_widgets/cart_list_item_widget.dart';

class CartListWidget extends StatelessWidget {
  final List<Cart> list;
  final String heroTag;
  CartListWidget({Key? key, required this.list, this.heroTag = 'cart_list_item_'});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) =>
          CartListItemWidget(cartItem: list[index]),
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(4),
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
    );
  }
}
