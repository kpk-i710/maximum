import 'package:get/get_connect/http/src/response/response.dart';

import '../models/news.dart';
import '../models/app_banner.dart';
import 'base_repo.dart';

class AppRepo extends BaseRepo {


  getBannerList() async => await get('baner', decoder: (list) =>
      AppBanner.fromMapList(list));

  getDiscountBannerList() async =>
      await get('baner', decoder: (list) => AppBanner.fromMapList(list));

  getNewsList({int? pageSize, String? sort}) async {
    final _args = <String, dynamic>{};
    if (pageSize != null) _args['pageSize'] = pageSize;
    if (sort != null) _args['sort'] = sort;

    return await get(getUrlWithArguments('news', args: _args),
        decoder: (list) => News1.fromMapList(list));
  }



  Future<Response> getInfo(String url) => get('https://max.kg/$url');
}