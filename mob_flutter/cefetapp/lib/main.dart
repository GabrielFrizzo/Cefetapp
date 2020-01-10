import 'package:cefetapp/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cefetapp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Futura',
      ),
      home: MyHomePage(title: 'Cefetapp'),
      debugShowCheckedModeBanner: false,
    );
  }
}
