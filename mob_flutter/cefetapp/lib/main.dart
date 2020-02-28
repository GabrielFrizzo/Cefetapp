import 'package:flutter/material.dart';

import 'route_generator.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
      },
      child: MaterialApp(
        title: 'Cefetapp',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Futura',
        ),
        initialRoute: '/home',
        onGenerateRoute: RouteGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
