import 'package:cefetapp/presentation/cefet_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:cefetapp/home_button.dart';

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
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(50),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 25),
                            child: Text(
                              'Oi, Gabriel',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: _headTxtColor,
                              ),
                            ),
                          ),
                          Text(
                            'Engenharia de Computação',
                            style:
                                TextStyle(color: _headTxtColor, fontSize: 17),
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
                    ),
                    CircleAvatar(
                      radius: 52,
                      backgroundColor: Colors.white,
                      child: Material(
                        elevation: 4.0,
                        shape: CircleBorder(),
                        clipBehavior: Clip.hardEdge,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: NetworkImage(
                              'https://avatars2.githubusercontent.com/u/34910470?s=400&u=522442f28ae28b8e12dd27f93291dbfbc6ca4e39&v=4'),
                          padding: EdgeInsets.all(5),
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                          child: InkWell(
                            onTap: () {
                              print('asasd');
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      HomeButton(
                        buttonTxt: 'Grade Horária',
                        icon: CefetIcon.calendar,
                      ),
                      HomeButton(
                        buttonTxt: 'Biblioteca',
                        icon: CefetIcon.books,
                      ),
                      HomeButton(
                        buttonTxt: 'Histórico',
                        icon: CefetIcon.hat,
                        padding: 15,
                      ),
                      HomeButton(
                        buttonTxt: 'Disciplinas',
                        icon: CefetIcon.paper,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
