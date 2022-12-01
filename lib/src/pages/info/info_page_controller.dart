import 'package:get/get.dart';
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import '../../repositories/app_repo.dart';

class InfoPageController extends GetxController {
  final String url;
  String html = '';
  bool loading = true;

  final _appRepo = Get.find<AppRepo>();

  InfoPageController(this.url);

  @override
  void onInit() {
    loadInfo();
    super.onInit();
  }

  loadInfo() {
    loading = true;
    _appRepo.getInfo(url).then((response) {
      loading = false;
      if (response.status.isOk) {
        var document = parse(response.body.toString());
        html = document.getElementsByClassName('mmain').first.innerHtml;
        update();
      }
    });
  }
}
