import 'package:flutter/material.dart';
import 'package:list_maker/data/model.dart';
import 'package:list_maker/ui/widget/input_new_item_page_button.dart';
import 'package:provider/provider.dart';
import 'package:advanced_share/advanced_share.dart';

class ViewCheckList extends StatefulWidget {
  final String checkListName;
  final int checkListId;

  const ViewCheckList(
      {Key key, @required this.checkListId, @required this.checkListName})
      : super(key: key);
  @override
  _ViewCheckListState createState() => _ViewCheckListState();
}

class _ViewCheckListState extends State<ViewCheckList> {
  List<ItemList> selectedItems;
  static int mainTotal;
  int total;
  int multiple;

  @override
  void initState() {
    super.initState();
    selectedItems = [];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Future<bool> g;
        moveToLastScreen();
        return g;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.checkListName),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              moveToLastScreen();
            },
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: _buildItemListTable(context),
            ),
            // InputNewItem(checkListId: widget.checkListId,),
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<ItemList>> _buildItemListTable(BuildContext context) {
    final dao = Provider.of<ItemListDao>(context);
    return StreamBuilder(
      stream: dao.watchAllItemLists(widget.checkListId),
      builder: (context, AsyncSnapshot<List<ItemList>> snapshot) {
        final itemLists = snapshot.data ?? List();
        return _buildTableBody(itemLists);
      },
    );
  }

  Widget _buildTableBody(List<ItemList> itemLists) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            child: SingleChildScrollView(
              child: FittedBox(
                child: DataTable(
                  columns: <DataColumn>[
                    DataColumn(
                      label: Text('Item Name'),
                    ),
                    DataColumn(
                      label: Text('No. of Items'),
                    ),
                    DataColumn(
                      label: Text('Unit Price'),
                    ),
                  ],
                  rows: itemLists
                      .map(
                        (item) => DataRow(
                          selected: selectedItems.contains(item),
                          onSelectChanged: (b) {
                            if (b)
                              debugPrint('Selected an item');
                            else
                              debugPrint('Unselected an item');
                            onSelectedRow(b, item);
                          },
                          cells: [
                            DataCell(Text(item.itemName)),
                            DataCell(
                              Text(item.noOfItems),
                            ),
                            DataCell(
                              Text(item.unitPrice),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _printTotal(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: IconButton(
                  onPressed: () {
                    // The Share Button, Allows u to send the content of the check list
                    // as a request to anyone
                    if (itemLists.isNotEmpty) {
                      debugPrint('share List');
                      String message = "";
                      for (int i = 0; i < itemLists.length; i++) {
                        message += 'i Want ' +
                            itemLists[i].noOfItems +
                            ' ' +
                            itemLists[i].itemName +
                            '(s) for ' +
                            itemLists[i].unitPrice +
                            ' each. \n';
                      }
                      message += 'Total is ' + mainTotal.toString();
                      message += '\n\nGenerated by Tally App. \nGet it on google play store \nor apple app store';
                      AdvancedShare.generic(
                        msg: message,
                        subject: "LIST OF ITEMS",
                      );
                    }else{
                      debugPrint('List is empty');
                    }
                  },
                  icon: CircleAvatar(child: Icon(Icons.share)),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: InputNewItemButton(widget.checkListId),
              ),
            ),
            Expanded(
              child: ListTile(
                title: IconButton(
                  onPressed: () {
                    deleteSelected();
                  },
                  icon: CircleAvatar(child: Icon(Icons.delete)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void onSelectedRow(bool selected, ItemList item) async {
    setState(() {
      if (selected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  Widget _printTotal() {
    final dao = Provider.of<ItemListDao>(context);
    return FutureBuilder(
      future: dao.getAllItemLists(
          widget.checkListId), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        List<ItemList> itemList = snapshot.data ?? List();
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
          // return Center(child: Text('Awaiting result...'));
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: Text(
                  "Total: " + _getTotal(itemList).toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
        }
        return null; // unreachable
      },
    );
  }

  void deleteSelected() {
    if (selectedItems.isNotEmpty) {
      setState(() {
        debugPrint('Deleted ' + selectedItems.length.toString() + ' item(s)');
        List<ItemList> temp = [];
        temp.addAll(selectedItems);
        for (ItemList item in temp) {
          final dao = Provider.of<ItemListDao>(context);
          dao.deleteItemList(item);
          selectedItems.remove(item);
        }
      });
    } else {
      debugPrint('No selected item to delete');
    }
  }

  int _getTotal(List<ItemList> itemLists) {
    int total = 0;
    for (int i = 0; i < itemLists.length; i++) {
      var noOfItems = int.parse(itemLists[i].noOfItems);
      var unitPrice = int.parse(itemLists[i].unitPrice);
      multiple = noOfItems * unitPrice;
      total += multiple;
    }
    mainTotal = total;
    return total;
  }

  void moveToLastScreen() {
    Navigator.pop(context, mainTotal);
  }
}