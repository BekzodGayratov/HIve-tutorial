import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:youtube/screens/home_page.dart';
import 'package:youtube/service/hive_service.dart';

void main() async {
  await Hive.initFlutter();
  await MyDB.openBox();
  MyDB.registerAdapter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
