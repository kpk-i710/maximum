import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/catalog.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class CatalogListItemWidget extends StatelessWidget {
  final Catalog catalog;

  final Function()? onTap;

  final int index;

  CatalogListItemWidget(
      {required this.catalog, this.onTap, required this.index});

  List<String> images = [
    "candy",
    "tea",
    "candy",
    "tea",
    "candy",
    "tea",
    "candy",
    "tea",
    "candy",
    "tea",
    "candy",
    "tea"
  ];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  widgets.boxShadowsCatalog(
                    child: Container(
                      child: Image.asset("assets/images/${images[index]}.jpg"),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      width: 50,
                      height: 50,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '${catalog.name}',
                    overflow: TextOverflow.ellipsis,
                    style: widgets.robotoConsid(
                        color: Color(0xff2C2C2C), fontSize: 16),
                  ),
                ],
              ),
            ),
            catalog.isLeaf
                ? Icon(Icons.keyboard_arrow_right, size: 20)
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
