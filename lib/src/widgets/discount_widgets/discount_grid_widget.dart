import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';

import '../../helpers/helper.dart';
import '../../models/discount.dart';
import '../widgets.dart' as widgets;
import 'discount_grid_item_widget.dart';

class DiscountGridWidget extends StatelessWidget {
  final List<Discount> list;

  DiscountGridWidget({Key? key, required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      width: double.infinity,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return list.isEmpty
              ? Container(
                  height: 180,
                  margin: EdgeInsets.all(8.0),
                  child: widgets.blockPlaceholder())
              : InkWell(
                  onTap: () {
                    Get.toNamed(
                      AppRouter.discount,
                      // arguments: list[index]
                      arguments: {
                        "idDiscount": list[index].id,
                        "title": list[index].title,
                      },
                    );
                  },
                  child: DiscountGridItemWidget(
                    discount: list.elementAt(index),
                    index: index,
                  ),
                );
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
