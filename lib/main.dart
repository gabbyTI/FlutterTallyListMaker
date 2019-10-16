import 'package:flutter/material.dart';
import 'package:list_maker/ui/home_page.dart';
import 'package:provider/provider.dart';

import 'data/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final db = AppDatabase();
    return MultiProvider(
      providers: [
        Provider(builder: (_) => db.checkListDao,),
        Provider(builder: (_) => db.itemListDao,),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
