import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final _books = [
    ['Orgulho e Preconceito', 'Jane Austen', 3],
    ['Orgulho e Preconceito', 'Jane Austen', 2],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment(-0.6, 0),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Hero(
              tag: 'Biblioteca',
              child: Material(
                //Fixes Hero bug with text
                color: Colors.transparent,
                child: Text(
                  'Biblioteca',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: _books
                    .map((_book) => _buildBookTile(context, _book))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget _buildBookTile(BuildContext context, List<Object> book) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(2, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {},
        child: Text(book[0]),
      ),
    );
  }
}
