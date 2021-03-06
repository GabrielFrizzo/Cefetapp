import 'dart:math';

import 'package:cefetapp/core/presentation/widgets/titlebar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/usecases/get_current_classes.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double xOffset = 20;
  double yOffset = 40;
  final width = 900;
  final height = 800;
  final titleRatio = 0.2;

  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;
    final sHeight = MediaQuery.of(context).size.height * (1 - titleRatio);
    return Scaffold(
      appBar: buildTitleBar(context: context, title: 'Grade Horária'),
      body: Stack(
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
                  xOffset = max(min(xOffset + dx, 20), sWidth - width - 20);
                  yOffset = max(min(yOffset + dy, 40), sHeight - height);
                });
              },
              child: buildSchedule(),
            ),
          ),
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

  List<Widget> buildClassTiles() {
    List<Widget> tiles = [];

    final _classes = GetCurrentClasses().call();

    _classes.forEach((_class) {
      for (var i = 0; i < _class.times.length; i++) {
        final _x = 65 + _class.days[i] * 167.0;
        final _ys = 30 + _class.enumTimes[i][0] * 44.6;
        final _ye = 62 + (_class.enumTimes[i][1] - 1) * 44.6;
        final _color = _class.color;

        tiles.add(Positioned.fromRect(
          rect: Rect.fromLTRB(_x, _ys, _x + 110, _ye),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 11.0),
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
            child: InkWell(
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
              onTap: () {
                return Navigator.of(context)
                    .pushNamed('/subject_details', arguments: _class);
              },
            ),
          ),
        ));
      }
    });

    return tiles;
  }
}
