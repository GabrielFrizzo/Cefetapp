import 'package:flutter/material.dart';

import '../../../../core/domain/entities/subject.dart';
import '../../../../core/domain/usecases/get_current_classes.dart';
import '../../../../core/presentation/widgets/titlebar.dart';

class SubjectsPage extends StatelessWidget {
  final _classes = GetCurrentClasses().call();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildTitleBar(context: context, title: 'Disciplinas Matriculadas'),
      body: ListView(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          children: _classes
              .map((_class) => _buildClassTile(context, _class))
              .toList()),
    );
  }

  Widget _buildClassTile(BuildContext context, Subject _class) {
    final Color _color = _class.color;
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
          Navigator.of(context).pushNamed(
            '/subject_details',
            arguments: _class,
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


