import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maxkgapp/src/pages/banner/list_banner_controller.dart';

class listBanner extends StatelessWidget {


  final controller = Get.put(ListBannerController());

    listBanner({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Список товаров из баннера ${Get.arguments['idBanners']} ")),
      )
    );
  }
}
