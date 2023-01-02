import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/discount.dart';
import '../widgets.dart' as widgets;
import 'bought_today_item_black_widget.dart';
import 'bought_today_item_widget.dart';

class BoughtTodayGridWidget extends StatelessWidget {
  final List<Discount> list;

  BoughtTodayGridWidget({Key? key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: Get.width / 2.7 + 95),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemBuilder: (contexwidgetst, index) {
            return   currentItem(index: index);
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
      return BoughtTodayItemBlackWidget(
        index: index,
        list: list,
      );
    }
    return BoughtTodayItemRedWidget(
      index: index,
      list: list,
    );
  }
}
// BoughtTodayItemWidget
