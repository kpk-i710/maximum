import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DicountCardPageController extends GetxController {
  var demoList = <bool>[
    false,
    false,
    false,
    false,
  ].obs;

  final videoURL = "https://youtu.be/YMx8Bbev6T4";

  late YoutubePlayerController controller;

  @override
  void onInit() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    controller = YoutubePlayerController(
        initialVideoId: videoID!,
        flags: const YoutubePlayerFlags(
            autoPlay: false,  ));
    super.onInit();
  }
}
