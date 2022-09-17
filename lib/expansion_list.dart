import 'package:flutter/material.dart';

import 'BasicTile.dart';

class ExpansionScreen extends StatefulWidget {
  const ExpansionScreen({Key? key}) : super(key: key);

  @override
  State<ExpansionScreen> createState() => _ExpansionScreenState();
}

class _ExpansionScreenState extends State<ExpansionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expandable List'),
      ),
      body: ListView(
        children: basicTiles.map(buildTile).toList(),
      ),
    );
  }
  Widget buildTile(BasicTile tile,{double leftPadding = 16}){
    if(tile.tiles.isEmpty){
      return ListTile(
        contentPadding: EdgeInsets.only(left: leftPadding),
        title: Text(tile.title),
        onTap: (){
          /*Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>DetailsPage(tile: tile),
              ),
          );*/
        },
      );
    }
    else{
      return ExpansionTile(
        tilePadding: EdgeInsets.only(left: leftPadding),
       /* trailing: const SizedBox.shrink(),
        leading: const Icon(Icons.keyboard_arrow_right_outlined),*/
        title: Text(tile.title),
        children: tile.tiles.map((tile) => buildTile(tile)).toList(),
      );
    }

  }
}
