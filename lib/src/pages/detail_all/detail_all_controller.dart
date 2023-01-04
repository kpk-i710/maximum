

import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetalAllController extends GetxController {




  final currentIndex = 0.obs;
  PageController controllerSwipe =  PageController();

  RxBool isScrollAble = true.obs;

 Matrix4 defaultMetrixAnaibleScroll(){
     isScrollAble.value = true;
     return Matrix4.identity();
  }


  YoutubePlayerController  controller = YoutubePlayerController(
    initialVideoId: '-HKRoeeVv9E',
    flags: YoutubePlayerFlags(
      autoPlay: false,
      mute: true,
    ),
  );



}