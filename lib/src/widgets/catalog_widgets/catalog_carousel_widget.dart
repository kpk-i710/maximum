import 'package:flutter/material.dart';

import '../../models/catalog.dart';
import '../../widgets/widgets.dart' as widgets;
import 'catalog_item_widget.dart';

class CatalogCarouselWidget extends StatelessWidget {
  final List<Catalog> list;
  final String heroTag;
  final String type;

  CatalogCarouselWidget(
      {Key? key,
      required this.list,
      this.heroTag = 'catalog_item_',
      this.type = 'main'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rightPadding = type == 'main' ? 20 : 2;
    return Container(
        height: type == 'main' ? 150 : 80,
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: list.isEmpty ? 4 : list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  left: (index == 0) ? 20 : 0, right: rightPadding),
              child: list.isEmpty
                  ? widgets.catalogPlaceholder()
                  : CatalogItemWidget(
                      catalog: list.elementAt(index),
                    ),
            );
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
