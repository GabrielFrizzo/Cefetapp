import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

import '../../../../core/domain/entities/subject.dart';

class SubjectDetailsPage extends StatelessWidget {
  SubjectDetailsPage({@required this.subject}) : color = subject.color;

  final Subject subject;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30),
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            padding: EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  subject.name,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
                Text(
                  subject.initials,
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Column(
            children: zip([subject.times, subject.rooms]).map((row) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      row[0],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    decoration: BoxDecoration(
                      color: _darkenColor(color),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      row[1],
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
          DefaultTextStyle(
            child: Container(
              margin: EdgeInsets.only(left: 30),
              child: Column(
                children: <Widget>[
                  statisticItem(
                    desc: 'Limite de Faltas:',
                    value: subject.absenceLimit.toString(),
                  ),
                  statisticItem(
                    desc: 'Faltas:',
                    value: subject.currentAbsences.toString(),
                  ),
                  statisticItem(
                    desc: 'Frequência:',
                    value: '${subject.attendance.toString()}%',
                  ),
                  statisticItem(
                    desc: 'Média Parcial',
                    value: subject.average.toString(),
                  ),
                ],
              ),
            ),
            style: TextStyle(
                fontSize: 18, color: Colors.black, fontFamily: 'Futura'),
          )
        ],
      ),
    );
  }

  Color _darkenColor(color) {
    return HSLColor.fromColor(color)
                        .withLightness(0.18)
                        .toColor();
  }

  Widget statisticItem({@required String desc, @required String value}) {
    return CustomPaint(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 10.0, bottom: 2.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(desc),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(value),
            )
          ],
        ),
      ),
      painter: _CustomDividerPainter(),
    );
  }
}

class _CustomDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final start = Offset(0, size.height * 0.75);
    final p1 = Offset(size.width * 0.01, size.height);
    final p2 = Offset(size.width * 0.1, size.height);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
