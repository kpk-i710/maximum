import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/styles.dart';

import '../../helpers/app_router.dart';
import '../../helpers/helper.dart';
import '../../models/discount.dart';
import '../widgets.dart' as widgets;
import 'bought_today_item_black_widget.dart';
import 'bought_today_item_widget.dart';

class BoughtTodayGridWidget extends StatelessWidget {
  final List<Discount> list;


  BoughtTodayGridWidget(
      {Key? key, required this.list });

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: list.isEmpty ? 4 : list.length,
      itemBuilder: (BuildContext context, int index) {
        return list.isEmpty
            ? Container(
                height: 180,
                margin: EdgeInsets.all(8.0),
                child: widgets.blockPlaceholder())
            : index == 0
                ? BoughtTodayItemBlackWidget(
                    list: list,

                    index: index,
                  )
                : BoughtTodayItemWidget(
                    list: list,

                    index: index,
                  );
      },
      staggeredTileBuilder: (int index) =>
          StaggeredTile.fit(Helper.responsive(2, md: 1, lg: 1, xl: 1)),
      mainAxisSpacing: 0,
      crossAxisSpacing: 15,
    );
  }
}
