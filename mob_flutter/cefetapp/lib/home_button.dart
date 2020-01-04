import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({
    Key key,
    @required String buttonTxt,
    @required IconData icon,
    double padding: 0,
  })  : _buttonTxt = buttonTxt,
        _icon = icon,
        _padding = padding,
        super(key: key);

  final String _buttonTxt;
  final IconData _icon;
  final double _padding;

  @override
  Widget build(BuildContext context) {
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
        color: Theme.of(context).primaryColorLight,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: () {},
        elevation: 0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Text(
                _buttonTxt,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 25, color: Colors.black87),
              ),
            ),
            Icon(_icon, size: 50),
            Padding(
              padding: EdgeInsets.only(right: _padding),
            )
          ],
        ),
      ),
    );
  }
}
