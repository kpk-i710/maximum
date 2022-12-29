

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetalAllController extends GetxController {


  YoutubePlayerController  controller = YoutubePlayerController(
    initialVideoId: '-HKRoeeVv9E',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  String getPrice(int?  price){
    NumberFormat numberFormat = NumberFormat("#,##0", "en_US");
   return  numberFormat.format(price).replaceAll(",", " ");
  }

  double LessThanTwelth(int fontSize){
    if(fontSize<=12){
      return 1;
    }else return fontSize-12;

  }

}