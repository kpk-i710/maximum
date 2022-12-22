import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/discount.dart';
import 'discount_grid_item_widget.dart';
import 'discount_widget.dart';

class DiscountListWidget extends StatelessWidget {
  final List<Discount> list;

  final Function(int index)? onItemTap;

  const DiscountListWidget({super.key, required this.list, this.onItemTap});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      primary: false,
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () => onItemTap!(index),
          child: DiscountGridItemWidget(discount: list.elementAt(index)),
        );
      }, separatorBuilder: (BuildContext context, int index) {
      return  SizedBox(height: 20);
    },

    );
  }
}
