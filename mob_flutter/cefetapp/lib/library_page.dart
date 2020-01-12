import 'package:flutter/material.dart';

class LibraryPage extends StatelessWidget {
  final _books = [
    _Book('Orgulho e Preconceito', 'Jane Austen', 2, 5),
    _Book('Orgulho e Preconceito', 'Jane Austen', 2, -3),
    _Book('Orgulho e Preconceito', 'Jane Austen', 3, 3),
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

  Widget _buildBookTile(BuildContext context, _Book book) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(vertical: 15),
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
      child: Row(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: DefaultTextStyle(
              style: TextStyle(color: Colors.white),
              child: book.daysLeft < 0
                  ? _buildLateTile(book.renewals, -book.daysLeft)
                  : _buildEarlyTile(book.renewals, book.daysLeft),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(20)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(book.name, style: TextStyle(fontSize: 20)),
                  Text(
                    book.author,
                    style: TextStyle(color: Color(0xFF9EA4A9), fontSize: 17),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildLateTile(int renewals, int debt) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        color: Color(0xFFD06464),
      ),
      child: InkWell(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('$renewals/3', style: TextStyle(fontSize: 20)),
            Text('Atrasado', style: TextStyle(fontSize: 16)),
            Text('Multa: R\$ $debt,00'),
          ],
        ),
      ),
    );
  }

  Widget _buildEarlyTile(int renewals, int daysLeft) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        color: Color(0xFF8EB19D),
      ),
      child: InkWell(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('$renewals/3', style: TextStyle(fontSize: 20)),
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xAA6B8476),
              ),
              child: Icon(
                Icons.autorenew,
                color: renewals == 3 ? Colors.white24 : Colors.white,
              ),
            ),
            Text('Devolução: $daysLeft dias'),
          ],
        ),
      ),
    );
  }
}

class _Book {
  final String name;
  final String author;
  final int renewals;
  final int daysLeft;
  const _Book(this.name, this.author, this.renewals, this.daysLeft);
}
