import 'package:flutter/material.dart';
import 'package:list_maker/data/model.dart';
import 'package:provider/provider.dart';

class NewItemListInput extends StatefulWidget {
  final int checkListId;

  const NewItemListInput({Key key, this.checkListId}) : super(key: key);

  @override
  _NewItemListInputState createState() => _NewItemListInputState();
}

class _NewItemListInputState extends State<NewItemListInput> {
  TextEditingController itemNameTextController;
  TextEditingController noOfItemsTextController;
  TextEditingController unitPriceTextController;

  var itemName;
  var noOfItems;
  var unitPrice;

  final key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    itemNameTextController = TextEditingController();
    noOfItemsTextController = TextEditingController();
    unitPriceTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        controller: itemNameTextController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(labelText: 'item name'),
                        // validator: (value) {
                        //   value.trim().isEmpty
                        //       ? value = "Can't be empty"
                        //       : value = null;
                        //   return value;
                        // },
                        onSaved: (value) {
                          itemName = value;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        controller: noOfItemsTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'No of Items'),
                        // validator: (value) {
                        //   value.trim().isEmpty
                        //       ? value = "Can't be empty"
                        //       : value = null;
                        //   return value;
                        // },
                        onSaved: (value) {
                          noOfItems = value;
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: TextFormField(
                        controller: unitPriceTextController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Unit Price'),
                        // validator: (value) {
                        //   value.trim().isEmpty
                        //       ? value = "Can't be empty"
                        //       : value = null;
                        //   return value;
                        // },
                        onSaved: (value) {
                          unitPrice = value;
                        },
                      ),
                    ),
                  ),
                ],
              ),
              IconButton(
                icon: CircleAvatar(child: Icon(Icons.add)),
                onPressed: () {
                  if (this.key.currentState.validate()) {
                    this.key.currentState.save();
                    final dao = Provider.of<ItemListDao>(context);
                    ItemList itemList = ItemList(
                      id: null,
                      itemName: itemName,
                      noOfItems: noOfItems,
                      unitPrice: unitPrice,
                      checkListId: widget.checkListId,
                    );
                    dao.insertItemList(itemList);
                    debugPrint('Inserted new item');
                    // itemNameTextController.clear();
                    // unitPriceTextController.clear();
                    // noOfItemsTextController.clear();
                    // AlertDialog(
                    //   title: Text('data'),
                    // );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
