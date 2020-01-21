import 'package:cefetapp/library_page.dart';
import 'package:cefetapp/presentation/cefet_icon_icons.dart';
import 'package:cefetapp/schedule_page.dart';
import 'package:cefetapp/subjects_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    final _headTxtColor = Colors.white;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(),
            painter: HomePainter(),
          ),
          Stack(
            children: <Widget>[
              FractionallySizedBox(
                heightFactor: 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Oi, Gabriel',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: _headTxtColor,
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Engenharia de Computação',
                          style: TextStyle(color: _headTxtColor, fontSize: 17),
                        ),
                        Text(
                          'Registro Acadêmico: 1904981',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: _headTxtColor,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Expanded(
                          child: CircleAvatar(
                            radius: 47,
                            backgroundColor: Colors.white,
                            child: Material(
                              elevation: 4.0,
                              shape: CircleBorder(),
                              clipBehavior: Clip.hardEdge,
                              color: Colors.transparent,
                              child: Ink.image(
                                image: NetworkImage(
                                    'https://avatars2.githubusercontent.com/u/34910470?s=400&u=522442f28ae28b8e12dd27f93291dbfbc6ca4e39&v=4'),
                                fit: BoxFit.cover,
                                width: 90,
                                height: 90,
                                child: InkWell(
                                  onTap: () {
                                    print('asasd');
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        FlatButton(
                          color: Color(0xA0446B86),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Sair',
                            style:
                                TextStyle(color: _headTxtColor, fontSize: 17),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment(0, 0.7),
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildHomeButton(
                      context,
                      buttonTxt: 'Grade Horária',
                      icon: CefetIcon.calendar,
                      route: SchedulePage(),
                    ),
                    buildHomeButton(
                      context,
                      buttonTxt: 'Biblioteca',
                      icon: CefetIcon.books,
                      route: LibraryPage(),
                    ),
                    buildHomeButton(
                      context,
                      buttonTxt: 'Histórico',
                      icon: CefetIcon.hat,
                      route: SubjectsPage(),
                      padding: 15,
                    ),
                    buildHomeButton(
                      context,
                      buttonTxt: 'Disciplinas Matriculadas',
                      icon: CefetIcon.paper,
                      route: SubjectsPage(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildHomeButton(
    BuildContext context, {
    String buttonTxt,
    IconData icon,
    double padding: 0,
    Widget route,
  }) {
    return Container(
      padding: EdgeInsets.all(1),
      margin: EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height * 0.11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 50, 0.7),
            offset: Offset(2, 2),
            blurRadius: 1,
          ),
        ],
      ),
      child: RaisedButton(
        color: Color(0xFFB3D3E5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => route),
          );
        },
        elevation: 0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(
                buttonTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.black87,
                ),
              ),
            ),
            Icon(icon, size: 50),
            Padding(
              padding: EdgeInsets.only(right: padding),
            )
          ],
        ),
      ),
    );
  }
}

class HomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xFF7AB8E4);

    canvas.drawOval(
        Rect.fromCenter(
          center: Offset(size.width, 0),
          width: size.width * 2 * 1.3,
          height: size.height * 2 * 0.35,
        ),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
