import 'dart:math';

import 'package:cefetapp/subjects_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double xOffset = 0;
  double yOffset = 0;
  final width = 900;
  final height = 800;
  final titleRatio = 0.2;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height * (1 - titleRatio);
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildTitle(context, titleRatio),
          Expanded(
            child: Stack(
              children: <Widget>[
                Positioned.fromRect(
                  rect: Rect.fromPoints(
                    Offset(xOffset, yOffset),
                    Offset(xOffset + width, yOffset + height),
                  ),
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanUpdate: (DragUpdateDetails details) {
                      double dx = details.delta.dx;
                      double dy = details.delta.dy;

                      setState(() {
                        xOffset =
                            max(min(xOffset + dx, 20), sWidth - width - 20);
                        yOffset = max(min(yOffset + dy, 0), sHeight - height);
                      });
                    },
                    child: buildSchedule(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildSchedule() {
    final daysOfWeek = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta'];
    final classTimes = [
      '07:30',
      '08:20',
      '09:10',
      '10:20',
      '11:10',
      '12:00',
      '13:00',
      '13:50',
      '14:40',
      '15:50',
      '16:40',
      '17:50',
      '18:40',
      '19:30',
      '20:20',
      '21:10',
      '22:00',
    ];

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(width: 25),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: daysOfWeek
                    .map((day) => Text(day, style: TextStyle(fontSize: 18)))
                    .toList(),
              ),
            ),
            SizedBox(width: 25),
          ],
        ),
        Divider(thickness: 2),
        Expanded(
          child: Stack(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: classTimes
                    .map((t) => Row(
                          children: <Widget>[
                            Text(t, style: TextStyle(color: Colors.grey[600])),
                            SizedBox(width: 15),
                            Expanded(
                              child: Divider(thickness: 2),
                            ),
                            SizedBox(width: 15),
                            Text(t, style: TextStyle(color: Colors.grey[600])),
                          ],
                        ))
                    .toList(),
              ),
              Stack(children: buildClassTiles()),
            ],
          ),
        )
      ],
    );
  }

  Widget buildTitle(BuildContext context, double titleRatio) {
    return Container(
      alignment: Alignment(-0.8, 0),
      height: MediaQuery.of(context).size.height * titleRatio,
      child: Text(
        'Grade Horária',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 26,
          color: Colors.black87,
        ),
      ),
    );
  }

  List<Widget> buildClassTiles() {
    List<Widget> tiles = [];

    classes.forEach((_class) {
      for (var i = 0; i < _class.times.length; i++) {
        final _x = 65 + _class.days[i] * 167.0;
        final _ys = 30 + _class.enumTimes[i][0] * 44.6;
        final _ye = 62 + (_class.enumTimes[i][1] - 1) * 44.6;
        final _color =
            Colors.primaries[_class.hashCode.toInt() % Colors.primaries.length];

        tiles.add(Positioned.fromRect(
          rect: Rect.fromLTRB(_x, _ys, _x + 110, _ye),
          child: Container(
            padding: EdgeInsets.all(1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _color,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(2, 2),
                  blurRadius: 1,
                ),
              ],
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    _class.name,
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    _class.rooms[i],
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ));
      }
    });

    return tiles;
  }
}
