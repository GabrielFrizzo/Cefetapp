import 'package:cefetapp/features/login/presentation/widgets/login_bottom_decoration.dart';
import 'package:flare_flutter/flare_actor.dart';
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
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 250,
                    child: FlareActor(
                      'assets/animations/logo_cefetapp.flr',
                      animation: 'write_utf',
                    ),
                  ),
                  Container(
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Registro Acadêmico',
                                  ),
                                ),
                                SizedBox(height: 20),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Senha do Portal do Aluno',
                                  ),
                                ),
                                SizedBox(height: 30),
                                buildLowerButton(
                                  text: 'Entrar',
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed('/home');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Tooltip(
                            message: 'Mensagem de dica',
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: const Color(0xFF5887A9),
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text('?',
                                    style: TextStyle(
                                      color: const Color(0xFF5887A9),
                                      fontFamily: 'Roboto',
                                      fontSize: 20,
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: double.infinity,
                    child: LoginBottomDecoration(),
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
        padding: const EdgeInsets.symmetric(vertical: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        color: const Color(0xFF5887A9),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
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
