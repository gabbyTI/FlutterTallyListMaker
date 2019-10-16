import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_maker/data/model.dart';
import 'package:provider/provider.dart';

class InputNewItem extends StatefulWidget {
  final checkListId;
  InputNewItem(this.checkListId);

  @override
  _InputNewItemState createState() => _InputNewItemState();
}

class _InputNewItemState extends State<InputNewItem> {
  final key = GlobalKey<FormState>();

  var itemName;
  var noOfItems;
  var unitPrice;

  TextEditingController itemNameTextController;
  TextEditingController noOfItemsTextController;
  TextEditingController unitPriceTextController;
  

  @override
  void initState() {
    super.initState();
    itemNameTextController = TextEditingController();
    noOfItemsTextController = TextEditingController();
    unitPriceTextController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert new Item'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                title: TextFormField(
                  controller: itemNameTextController,
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  validator: (value) {
                    value == ""
                        ? value = "This field can not be empty"
                        : value = null;
                    return value;
                  },
                  decoration: InputDecoration(
                    labelText: 'Name of item',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: 'eg: apple',
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: noOfItemsTextController,
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  validator: (value) {
                    value.trim().isEmpty
                        ? value = "This field can not be empty"
                        : value = null;
                    return value;
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  // onSaved: (value) {
                  //   noOfItems = value;
                  // },
                  decoration: InputDecoration(
                    labelText: 'Number of items',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: 'eg: 2',
                  ),
                ),
              ),
              ListTile(
                title: TextFormField(
                  controller: unitPriceTextController,
                  keyboardType: TextInputType.number,
                  autofocus: false,
                  validator: (value) {
                    value.trim().isEmpty
                        ? value = "This field can not be empty"
                        : value = null;
                    return value;
                  },
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  // onSaved: (value) {
                  //   unitPrice = value;
                  // },
                  decoration: InputDecoration(
                    labelText: 'Price per item',
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    hintText: 'eg: 100',
                  ),
                ),
              ),
              ListTile(
                title: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: RaisedButton(
                      color: Colors.blue,
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20.0),),) ,
                      child: Text('Add to List',style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        if (this.key.currentState.validate()) {
                          this.key.currentState.save();
                          itemName = itemNameTextController.text.trim();
                          noOfItems = noOfItemsTextController.text.trim();
                          unitPrice = unitPriceTextController.text.trim();
                          final dao = Provider.of<ItemListDao>(context);
                          final itemList = ItemList(
                            id: null,
                            itemName: itemName,
                            noOfItems: noOfItems,
                            unitPrice: unitPrice,
                            checkListId: widget.checkListId,
                          );
                          dao.insertItemList(itemList);
                          debugPrint('Inserted new item');
                          Navigator.pop(context, itemList);
                        }
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
