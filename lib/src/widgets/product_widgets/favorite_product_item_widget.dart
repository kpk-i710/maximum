import 'package:flutter/material.dart';

import '../../models/favorite.dart';
import '../../widgets/product_widgets/product_item_widget.dart';

class FavoriteProductItemWidget extends StatelessWidget {
  final String heroTag;
  final Favorite favorite;
  final double width;
  final bool top;

  const FavoriteProductItemWidget(
      {Key? key,
      required this.favorite,
      this.heroTag = 'fav_product_item_',
      this.width = 200,
      this.top = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProductItemWidget(
      list: favorite.product,
    );
  }
}
