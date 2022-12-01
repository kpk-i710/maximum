import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../helpers/helper.dart';
import '../../models/favorite.dart';
import '../widgets.dart' as widgets;
import 'favorite_product_item_widget.dart';

class FavoriteProductsGridWidget extends StatelessWidget {
  final List<Favorite> list;
  final String heroTag;
  final ScrollController? scrollController;
  final bool Function(ScrollNotification val)? onNotification;

  const FavoriteProductsGridWidget({Key? key, required this.list,
    this.heroTag = 'fav_product_grid_item_', this.scrollController, this.onNotification});

  @override
  Widget build(BuildContext context) {
    int fitValue = Helper.responsive(2, md: 1, lg: 1, xl: 1);
    return NotificationListener<ScrollNotification>(
      onNotification: onScrollNotification,
      child: StaggeredGridView.countBuilder(
        primary: false,
        shrinkWrap: true,
        crossAxisCount: 4,
        itemCount: list.length + 2,
        controller: scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index >= list.length)
            return widgets.productPlaceholder();

          return FavoriteProductItemWidget(
            favorite: list.elementAt(index),
            heroTag: heroTag,
            top: (fitValue == 2 && [0, 1].contains(index))
                || (fitValue == 1 && [0, 1, 2, 3].contains(index)),
          );
        },
        staggeredTileBuilder: (int index) {
          return StaggeredTile.fit(fitValue);
        },
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
    );
  }

  void listener() {
    print('scroll listener');
  }

  bool onScrollNotification(ScrollNotification not) {
    if (not is ScrollEndNotification) {
      print('scrollEndNotification');
      if (scrollController?.position.extentAfter == 0) {
        print('onScrollEnd');
      }
    }
    return true;
  }
}
