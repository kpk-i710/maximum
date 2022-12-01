import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../helpers/helper.dart';
import '../../models/order.dart';
import '../../widgets/order_widgets/order_widget.dart';

import 'current_order_widget.dart';

class OrderListWidget extends StatelessWidget {
  final List<Order> list;
  final bool currentOrders;

  const OrderListWidget({Key? key, required this.list, this.currentOrders = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return currentOrders
            ? CurrentOrderWidget(order: list.elementAt(index))
            : OrderWidget(order: list.elementAt(index));
      },
      staggeredTileBuilder: (int index) =>
      new StaggeredTile.fit(Helper.responsive(4, lg: 2, xl: 2)),
      mainAxisSpacing: 0,
      crossAxisSpacing: 0,
    );
  }

}