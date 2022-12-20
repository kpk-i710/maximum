import 'package:get/get.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import '../../../models/news_list.dart';
import '../../../repositories/dicount_repo_list.dart';

class PromotionsListPageController extends GetxController {
  NewsList? poromotionsList;
  void tabSelect(int index) => Helper.tabSelect(index);
  var isLoaded = false.obs;

  @override
  Future<void> onInit() async {
    poromotionsList =
        await RemoteService().getNews(Get.arguments['idNews'].toString());
    if (poromotionsList != null) {
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
