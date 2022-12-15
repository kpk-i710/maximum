import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DicountCardPageController extends GetxController {
  RxBool isAddedToCard = false.obs;

  var counter = 0.obs;

  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;

  final videoURL = "https://youtu.be/YMx8Bbev6T4";

  late YoutubePlayerController controller;

  minus() {
    if (counter >= 1) counter = counter - 1;
  }

  plus() {
    counter = counter + 1;
  }

  @override
  void onInit() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
        ));
    super.onInit();
  }
}
