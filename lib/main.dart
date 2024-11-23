import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todotask/pages/home_page.dart';

void main() async{
  //imit the hive
  Hive.initFlutter();
  //open the Box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home:HomePage(),
    );
  }
}

