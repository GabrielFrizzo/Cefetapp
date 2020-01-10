import 'dart:math';

import 'package:flutter/material.dart';

class SubjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _classes = [
      [
        'Eletrônica Geral 2',
        [
          'Seg 10:20 - 12:00',
          'Qua 15:50 - 17:30',
        ],
      ],
      [
        'Física 3',
        [
          'Seg 10:20 - 12:00',
          'Qua 15:50 - 17:30',
        ],
      ]
    ];

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment(-0.6, 0),
            height: MediaQuery.of(context).size.height * 0.2,
            child: Text(
              'Disciplinas Matriculadas',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          ),
          Expanded(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 30),
                children: _classes
                    .map((_class) =>
                        _buildClassTile(context, _class[0], _class[1]))
                    .toList()),
          )
        ],
      ),
    );
  }

  Widget _buildClassTile(
      BuildContext context, String _className, List<String> _times) {
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
        onPressed: () {},
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 15,
              left: 10,
              child: Text(
                _className,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 10,
              child: Column(
                children: _times
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
        // subtitle: Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: <Widget>[
        //     Text(
        //       'Seg 10:20 - 12:00',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     Text(
        //       'Qua 15:50 - 17:30',
        //       style: TextStyle(color: Colors.white),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
