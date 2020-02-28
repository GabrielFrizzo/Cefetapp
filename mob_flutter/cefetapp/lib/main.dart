import 'package:flutter/material.dart';

import 'route_generator.dart';

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
      initialRoute: '/home',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
