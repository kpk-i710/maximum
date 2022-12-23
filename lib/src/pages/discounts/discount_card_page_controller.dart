import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:maxkgapp/src/helpers/helper.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class DicountCardPageController extends GetxController {
  var counter = 0.obs;

  RxBool isAttached = false.obs;

  void tabSelect(int index) => Helper.tabSelect(index);
  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;

  final videoURL = "https://youtu.be/YMx8Bbev6T4";

  late YoutubePlayerController controller;

  minus({required BuildContext context}) {
    if (counter >= 1) {
      counter = counter - 1;
      saveCounter();
    }
    if (counter == 0) {
      widgets.deletedFromCardSnackBar(context: context);
    }
  }

  plus() {
    counter = counter + 1;
    saveCounter();
  }

  void saveCounter() {
    final box = GetStorage();
    box.write("counter", counter.value);
  }

  getCounter() {
    final box = GetStorage();
    box.writeIfNull('counter', 0);
    return box.read("counter");
  }

  @override
  void onInit() {
    ever(
        counter,
        (value) => () {
              final box = GetStorage();
              box.writeIfNull('counter', 0);
              counter.value = box.read('counter');
            });

    counter.value = getCounter();
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));

    super.onInit();
  }
}
