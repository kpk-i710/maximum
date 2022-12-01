import 'package:flutter/material.dart';
import '../../models/basic_tile.dart';

import '../../widgets/search_widgets/search_bar_2.dart';

class CatalogNew extends StatelessWidget {
  CatalogNew({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchBar2(title: "Каталог"),
        body: ListView(
          children: basicTiles.map(buildTile).toList(),
        ));
  }

  Widget buildTile(BasicTile tile) {
    return ExpansionTile(
      title: Text("tile"),
      children: tile.tiles.map((tile) => buildTile(tile)).toList(),
    );
  }
}
