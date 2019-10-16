import 'package:flutter/material.dart';
import 'package:list_maker/data/model.dart';
import 'package:provider/provider.dart';

class CreateNewCheckListPage extends StatefulWidget {
  @override
  _CreateNewCheckListPageState createState() => _CreateNewCheckListPageState();
}

class _CreateNewCheckListPageState extends State<CreateNewCheckListPage> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create new checklist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _buildTextField(context),
      ),
    );
  }

  Widget _buildTextField(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'eg: Market List',
        labelText: 'Name of CheckList',
      ),
      onSubmitted: (inputCheckListName) {
        final dao = Provider.of<CheckListDao>(context);
        final checkList = CheckList(
          id: null,
          checkListName: inputCheckListName.trim(),
          total: null,
        );
        dao.insertCheckList(checkList);
        debugPrint('Inserted new checklist');
        Navigator.pop(context);
      },
    );
  }
}
