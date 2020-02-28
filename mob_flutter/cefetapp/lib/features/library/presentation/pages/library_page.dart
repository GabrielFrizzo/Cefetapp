import 'package:cefetapp/features/library/domain/usecases/get_rented_books.dart';
import 'package:flutter/material.dart';

import '../../../../core/presentation/widgets/titlebar.dart';
import '../../domain/entities/book.dart';

class LibraryPage extends StatelessWidget {
  final _books = GetRentedBooks().call();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleBar(context: context, title: 'Biblioteca'),
      body: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
        children:
            _books.map((_book) => _buildBookTile(context, _book)).toList(),
      ),
    );
  }

  Widget _buildBookTile(BuildContext context, Book book) {
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
              child:
                  book.isLate() ? _buildLateTile(book) : _buildEarlyTile(book),
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

  Widget _buildLateTile(Book book) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
        color: Color(0xFFD06464),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('${book.renewals}/3', style: TextStyle(fontSize: 20)),
          Text('Atrasado', style: TextStyle(fontSize: 16)),
          Text('Multa: R\$ ${-book.daysLeft},00'),
        ],
      ),
    );
  }

  Widget _buildEarlyTile(Book book) {
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
            Text('${book.renewals}/3', style: TextStyle(fontSize: 20)),
            Ink(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xAA6B8476),
              ),
              child: Icon(
                Icons.autorenew,
                color: book.canRenew() ? Colors.white24 : Colors.white,
              ),
            ),
            Text('Devolução: ${book.daysLeft} dias'),
          ],
        ),
      ),
    );
  }
}
