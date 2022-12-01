

class  BasicTile{
    String title;
    List<BasicTile> tiles;

   BasicTile( { required this.title,   this.tiles = const []} );

}

final basicTiles  = <BasicTile>[
    BasicTile(
    title: "Fruties",
    tiles: [
      BasicTile(title: 'Apple'),
      BasicTile(title: 'Orange'),
      BasicTile(title: 'Banana'),
      BasicTile(title: 'Wather'),
    ]
  ),
  BasicTile(title: 'Continent',
    tiles: [
      BasicTile(
        title: 'Asia',
        tiles: [
          BasicTile(title: 'Afghanistan'),
          BasicTile(title: 'Iran'),
        ]
      ),
      BasicTile(
          title: 'Europe',
          tiles: [
            BasicTile(title: 'New Yorke'),
            BasicTile(title: 'Paris'),
          ]
      ), BasicTile(
          title: 'Europe',
          tiles: [
            BasicTile(title: 'New Yorke'),
            BasicTile(title: 'Paris'),
          ]
      )
    ]

  )
];

