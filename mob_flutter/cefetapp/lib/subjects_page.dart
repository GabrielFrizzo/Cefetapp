import 'dart:math';

import 'package:cefetapp/subject.dart';
import 'package:cefetapp/subject_details_page.dart';
import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _classes = [
      Subject(
          'Eletrônica Geral 2',
          [
            'Seg 10:20 - 12:00',
            'Qua 15:50 - 17:30',
          ],
          ['E-204', 'B-101'],
          'CSD-20 - S73',
          15,
          7,
          87.5,
          7.2),
      Subject(
          'Física 3',
          [
            'Seg 10:20 - 12:00',
            'Qua 15:50 - 17:30',
          ],
          ['E-104', 'B-101'],
          'CSD-20 - S71',
          18,
          2,
          82.5,
          4.2),
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment(-0.6, 0),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Hero(
              tag: 'Disciplinas Matriculadas',
              child: Material(
                //Fixes Hero bug with text
                color: Colors.transparent,
                child: Text(
                  'Disciplinas Matriculadas',
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
                children: _classes
                    .map((_class) =>
                        _buildClassTile(context, _class))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget _buildClassTile(
      BuildContext context, Subject _class) {
    final Color _color =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: _color.withAlpha(100),
            offset: Offset(2, 2),
            blurRadius: 1,
          ),
        ],
        color: _color,
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => SubjectDetailsPage(_class, _color)),
          );
        },
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              left: 10,
              child: Text(
                _class.name,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Column(
                children: _class.times
                    .map((time) => Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                          ),
                          child: Text(
                            time,
                            style: TextStyle(color: Colors.white),
                          ),
                        ))
                    .toList(),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 5,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
