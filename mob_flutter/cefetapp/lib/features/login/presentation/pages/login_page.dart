import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          CustomPaint(
            child: Container(),
            painter: LoginPainter(),
          ),
          Center(
            child: SingleChildScrollView(
              reverse: true,
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    margin: const EdgeInsets.symmetric(vertical: 40),
                    child: Image.asset('assets/images/logo.png', width: 200),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBFBFB),
                      boxShadow: [
                        BoxShadow(offset: Offset(1, 1), color: Colors.black54)
                      ],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: Stack(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.only(top: 30),
                          child: Form(
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(hintText: 'RA'),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Senha do Portal do Aluno',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Tooltip(
                            message: 'Mensagem de dica',
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: const Color(0xFF5887A9),
                              ),
                              child: Center(
                                child: Text('?',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.25,
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        buildLowerButton(
                          text: 'Entrar',
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(
                              left: 20, top: 25, bottom: 8),
                          child: Text('Novo por aqui?',
                              style: TextStyle(fontSize: 18)),
                        ),
                        Builder(
                          builder: (BuildContext context) {
                            return buildLowerButton(
                              text: 'Cadastrar',
                              onPressed: () {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Em construção!'),
                                    action: SnackBarAction(
                                      label: 'Ok',
                                      onPressed: () {
                                        Scaffold.of(context)
                                            .hideCurrentSnackBar();
                                      },
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLowerButton({String text, Function onPressed}) {
    return Container(
      width: 500,
      child: FlatButton(
        padding: const EdgeInsets.symmetric(vertical: 23),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: const Color(0xFF5887A9),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 23),
        ),
      ),
    );
  }
}

class LoginPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Color(0xFF7AB8E4);

    canvas.drawCircle(Offset(size.width / 2, 0), 400, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
