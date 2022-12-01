import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/app_router.dart';
import '../../helpers/helper.dart';

import '../../models/catalog.dart';
import '../widgets.dart' as widgets;
class CatalogItemWidget extends StatelessWidget {
  final Catalog catalog;

  const CatalogItemWidget({Key? key, required this.catalog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      focusColor: Theme.of(context).accentColor,
      highlightColor: Theme.of(context).primaryColor,
      onTap: () {
        Get.toNamed(AppRouter.productsByCatalog, arguments: {"id": catalog.id});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Color(0xffD9D9D9).withOpacity(0.4),
              spreadRadius: 0,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "assets/images/sofa.png",
                width: 120,
              ),
              Text("Стабилизаторы",style: widgets.robotoConsid(),),
            ],
          ),
        ),
      ),
    );
  }
}

// CachedNetworkImage(
// fit: BoxFit.cover,
// imageUrl: catalog.imageUrl!,
// placeholder: (context, url) => Image.asset(
// 'assets/images/maxkg.png',
// fit: BoxFit.cover,
// ),
// errorWidget: (context, url, error) => Icon(Icons.error),
// ),
