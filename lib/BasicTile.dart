class BasicTile{
   final String title;
   final List<BasicTile> tiles;
  const BasicTile({
    required this.title,this.tiles=const[],
});
}
final basicTiles = <BasicTile>[
  const BasicTile(
    title: 'Fruits',
    tiles: [
      BasicTile(title: 'Apple'),
      BasicTile(title: 'Orange'),
      BasicTile(title: 'Banana'),
      BasicTile(title: 'Watermelon'),
    ],
  ),
  const BasicTile(title: 'Continent',
    tiles: [
      BasicTile(title: 'Asia',
      tiles: [
        BasicTile(title: 'Afghanistan'),
        BasicTile(title: 'Iran'),
      ],
      ),
    ]

  )
];