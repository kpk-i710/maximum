import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../models/catalog.dart';
import '../../helpers/helper.dart';
import '../../widgets/widgets.dart' as widgets;
import 'catalog_item_widget.dart';

class CatalogGridWidget extends StatelessWidget {
  final List<Catalog> list;

  CatalogGridWidget({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 26,
            mainAxisSpacing: 26,
          ),
          itemCount: list.isEmpty ? 3 : list.length,
          itemBuilder: (BuildContext ctx, index) {
            return Container(
                alignment: Alignment.center,
                child: list.isEmpty
                    ? widgets.catalogPlaceholder()
                    : CatalogItemWidget(catalog: list.elementAt(index)));
          }),
    );
  }
}

// return StaggeredGridView.countBuilder(
// primary: false,
// shrinkWrap: true,
// crossAxisCount: 4,
// itemCount: list.isEmpty ? 3 : list.length,
// itemBuilder: (BuildContext context, int index) {
// return list.isEmpty
// ? widgets.catalogPlaceholder()
//     : CatalogItemWidget(
// catalog: list.elementAt(index) );
// },
// staggeredTileBuilder: (int index) =>
// StaggeredTile.fit(Helper.responsive(2, md: 1, lg: 1, xl: 1)),
//
//
// );
