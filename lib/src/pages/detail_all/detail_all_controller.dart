

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetalAllController extends GetxController {


  YoutubePlayerController  controller = YoutubePlayerController(
    initialVideoId: '-HKRoeeVv9E',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );



}