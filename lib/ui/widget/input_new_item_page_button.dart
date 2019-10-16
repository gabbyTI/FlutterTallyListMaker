import 'package:flutter/material.dart';
import 'package:list_maker/data/model.dart';
import 'package:list_maker/ui/input_new_item_for_a_checklist.dart';
// import 'package:provider/provider.dart';

class InputNewItemButton extends StatefulWidget {
  final checkListId;
  InputNewItemButton(this.checkListId);

  @override
  _InputNewItemButtonState createState() => _InputNewItemButtonState();
}

class _InputNewItemButtonState extends State<InputNewItemButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        iconSize: 60,
        icon: CircleAvatar(
          radius: 60,
          child: Icon(Icons.add),
        ),
        onPressed: () async {
          ItemList itemList = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InputNewItem(widget.checkListId)));
          if (itemList != null) {
            // final dao = Provider.of<ItemListDao>(context);
            // dao.insertItemList(itemList);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('New item added Successfully!!'),
                backgroundColor: Colors.green,
                duration: Duration(milliseconds: 800),
              ),
            );
          }
        },
      ),
    );
  }
}
