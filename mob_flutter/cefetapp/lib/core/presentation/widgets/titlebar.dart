import 'package:flutter/material.dart';

AppBar buildTitleBar({BuildContext context, String title}) {
  return AppBar(
    backgroundColor: Theme.of(context).canvasColor,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 27),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text(
      title,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
        color: Colors.black87,
      ),
    ),
  );
}
