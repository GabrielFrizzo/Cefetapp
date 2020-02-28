import 'package:flutter/material.dart';

import '../../../../core/domain/usecases/get_current_classes.dart';
import '../../../../core/presentation/widgets/circular_progress.dart';
import '../../../../core/presentation/widgets/titlebar.dart';
import '../../domain/usecases/get_missing_classes.dart';

class ReportPage extends StatelessWidget {
  final currentSubjects = GetCurrentClasses().call();
  final missingSubjects = GetMissingClasses().call();

  ReportPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleBar(context: context, title: 'Histórico'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSearchBar(),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCurrentSubjects(context: context),
                  _buildMissingSubjects(context: context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            height: 50,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 10, top: 2),
                hintText: 'Pesquisar...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                fillColor: Colors.red,
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Icon(Icons.menu),
        ),
      ],
    );
  }

  Widget _buildCurrentSubjects({@required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSubtitle(context: context, title: 'Cursadas'),
        SizedBox(height: 10),
        Column(
          children: currentSubjects.map((subject) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(subject.name),
                  ),
                  buildCircularProgress(
                    valueText: Text(subject.average.toString()),
                    value: subject.average,
                    maxValue: 10,
                    color:
                        subject.average >= 6.0 ? Colors.lightGreen : Colors.red,
                  ),
                  buildCircularProgress(
                    valueText: Text(
                      '${subject.attendance}%',
                      style: TextStyle(fontSize: 14),
                    ),
                    value: subject.attendance,
                    maxValue: 100,
                    color: subject.attendance >= 75
                        ? Colors.lightGreen
                        : Colors.red,
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget _buildMissingSubjects({@required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildSubtitle(context: context, title: 'Faltantes'),
        SizedBox(height: 20),
        Column(
            children: missingSubjects.map((subject) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(children: <Widget>[
              Container(
                width: 10,
                height: 5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: subject.color,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(subject.name),
              ),
            ]),
          );
        }).toList()),
      ],
    );
  }

  Widget _buildSubtitle({
    @required BuildContext context,
    @required String title,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: CustomPaint(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        painter: _CustomSubtitlePainter(),
      ),
    );
  }

  Widget buildCircularProgress({
    @required Text valueText,
    @required Color color,
    @required double value,
    @required double maxValue,
  }) {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.all(8.0),
      child: CustomPaint(
        child: Center(child: valueText),
        painter: CircularProgressPainter(
          color: color,
          value: value,
          maxValue: maxValue,
        ),
      ),
    );
  }
}

class _CustomSubtitlePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[400]
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    final start = Offset(0, size.height);
    final p0 = Offset(size.width * 0.9, size.height);
    final p1 = Offset(size.width * 0.99, size.height);
    final p2 = Offset(size.width, size.height * 0.75);

    final path = Path()
      ..moveTo(start.dx, start.dy)
      ..lineTo(p0.dx, p0.dy)
      ..quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
