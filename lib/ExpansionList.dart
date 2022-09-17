
import 'package:flutter/material.dart';
class ExpansionList extends StatefulWidget {
  const ExpansionList({Key? key}) : super(key: key);

  @override
  State<ExpansionList> createState() => _ExpansionListState();
}

class _ExpansionListState extends State<ExpansionList> {

  List<Item> _data=generateItems(10);
  Widget _buildListPanel(){
    return ExpansionPanelList(
      expansionCallback: (int index,bool isExpanded){
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item){
        return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded){
              return ListTile(
                title: Text(item.headerValue),
              );
            },
            body: ListTile(
              title: Text(item.expandedValue),
              subtitle: Text('To delete this panel, tap the trash can icon'),
              trailing: Icon(Icons.delete),
              onTap: (){
                setState(() {
                  _data.removeWhere((currentItem) => item == currentItem);
                });
              },
            ),
          isExpanded: item.isExpanded
        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expansion List'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: _buildListPanel(),
        ),
      ),
    );
  }
}
class Item{
  late String expandedValue;
  late String headerValue;
  late bool isExpanded;

  Item({required this.expandedValue, required this.headerValue, this.isExpanded = false});
}
List<Item> generateItems(int numberOfItems){
  return List.generate(numberOfItems, (index){
    return Item(
        expandedValue: 'Panel $index',
        headerValue: 'This is item number $index',
    );
  });
}
