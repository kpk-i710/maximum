import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/notification.dart';
import '../../styles.dart';

class NotificationListItemWidget extends StatelessWidget {
  final AppNotification notification;
  final String heroTag;

  const NotificationListItemWidget(
      {required this.notification, this.heroTag = 'notification_item_'});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${notification.date}'),
                  Icon(Icons.close),
                ],
              ),
              SizedBox(height: 3),
              Card(
                elevation: 5,
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.car_repair, color: context.theme.primary),
                          SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${notification.title}',
                                  style: TextStyle(color: context.theme.primary),
                              ),
                              SizedBox(height: 4),
                              Text('${notification.time}'),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('${notification.text}',
                          style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
