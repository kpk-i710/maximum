import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/notification.dart';
import 'notification_list_item_widget.dart';

class NotificationListWidget extends StatelessWidget {
  final List<AppNotification> list;
  final String heroTag;

  const NotificationListWidget({required this.list, this.heroTag = 'notification_item_'});

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 4,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return NotificationListItemWidget(
            notification: list.elementAt(index), heroTag: heroTag);
      },
      staggeredTileBuilder: (int index) => new StaggeredTile.fit(
          MediaQuery.of(context).orientation == Orientation.portrait ? 4 : 4),
      mainAxisSpacing: 20,
      crossAxisSpacing: 0,
    );
  }
}
