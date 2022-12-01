import 'package:get/get.dart';

import '../../../models/news.dart';
import '../../../models/news_list.dart';
import '../../../repositories/app_repo.dart';
import '../../../repositories/dicount_repo_list.dart';

class NewsListPageController extends GetxController {

  NewsList? newsList  ;
  var isLoaded = false.obs;


  @override
  Future<void> onInit() async {
    newsList =
        await RemoteService().getNews(Get.arguments['idNews'].toString());
    if (newsList != null) {
      isLoaded.value = true;
    }
    super.onInit();
  }

  @override
  void dispose() {

    // TODO: implement dispose
    super.dispose();
  }

}
