import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/route_manager.dart';
import '../../helpers/helper.dart';
import '../../models/discount.dart';

import '../widgets.dart' as widgets;
import 'brand_offers_item_black_widget.dart';
import 'brand_offers_item_widget.dart';

class BrandOffersGridWidget extends StatelessWidget {
  final List<Discount> list;

  BrandOffersGridWidget({Key? key, required this.list});


  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.width / 2.7 + 130),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (contexwidgetst, index) {
            return list.isEmpty
                ? widgets.productPlaceholder(width: 180, height: 160)
                : currentItem(index: index);
          },
          itemCount: 3,
          primary: false,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  Widget currentItem({required int index}) {
    if (index == 0) {
      return BrandOffersItemBlackWidget(
        index: index,
        list: list,
      );
    }
    return BrandOffersItemWidget(
      index: index,
      list: list,
    );
  }
}
// BrandOffersItemBlackWidget
// BrandOffersItemWidget