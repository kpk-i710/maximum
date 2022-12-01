import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../models/catalog.dart';
import '../../styles.dart';
import '../../widgets/widgets.dart' as widgets;

class CatalogListItemWidget extends StatelessWidget {
  final Catalog catalog;
  final String heroTag;
  final Function()? onTap;

  const CatalogListItemWidget(
      {required this.catalog, this.heroTag = 'catalog_item_', this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 13.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  catalog.image != null && catalog.image!.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: catalog.imageUrl!,
                          height: 50,
                          width: 50,
                        )
                      : SizedBox(width: 0),
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
