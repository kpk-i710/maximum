import 'package:get/get_connect/http/src/response/response.dart';

import '../models/news.dart';
import '../models/app_banner.dart';
import '../models/notification.dart';
import 'base_repo.dart';

class AppRepo extends BaseRepo {
  final notificationsList = [
    AppNotification(
        title: 'Заказ принят на доставку курьером',
        text: 'К вам приедет курьер Катаранчук Павел,' +
            '0770889976, ожидайте звонка. Для переноса даты и времени доставки ' +
            'сообщите курьеру заранее  за 1 час.',
        date: '25 марта',
        time: '13:45'),
    AppNotification(
        title: 'Заказ принят на доставку курьером',
        text: 'К вам приедет курьер Катаранчук Павел,' +
            '0770889976, ожидайте звонка. Для переноса даты и времени доставки ' +
            'сообщите курьеру заранее  за 1 час.',
        date: '25 марта',
        time: '13:45'),
  ];

  getBannerList() async => await get('baner', decoder: (list) =>
      AppBanner.fromMapList(list));

  getDiscountBannerList() async =>
      await get('baner', decoder: (list) => AppBanner.fromMapList(list));

  getNewsList({int? pageSize, String? sort}) async {
    final _args = <String, dynamic>{};
    if (pageSize != null) _args['pageSize'] = pageSize;
    if (sort != null) _args['sort'] = sort;

    return await get(getUrlWithArguments('news', args: _args),
        decoder: (list) => News.fromMapList(list));
  }

  getNotificationsList() async {
    Future.delayed(Duration(seconds: 4));

    return notificationsList;
  }

  Future<Response> getInfo(String url) => get('https://max.kg/$url');
}