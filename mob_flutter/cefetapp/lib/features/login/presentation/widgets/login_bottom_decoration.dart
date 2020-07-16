import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoginBottomDecoration extends StatefulWidget {
  LoginBottomDecoration({Key key}) : super(key: key);

  @override
  _LoginBottomDecorationState createState() => _LoginBottomDecorationState();
}

class _LoginBottomDecorationState extends State<LoginBottomDecoration> {
  bool finishedAnimation = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlareActor(
      'assets/animations/explosion.flr',
      animation: finishedAnimation ? 'idle' : 'explode',
      fit: BoxFit.fitHeight,
      callback: (_) {
        setState(() {
          finishedAnimation = true;
        });
      },
    );
  }
}

// class LoginBottomDecoration extends StatefulWidget {
//   @override
//   _LoginBottomDecorationState createState() => _LoginBottomDecorationState();
// }

// class _LoginBottomDecorationState extends State<LoginBottomDecoration>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(seconds: 2),
//     );

//     final _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

//     _animation = Tween<double>(begin: 0.0, end: 20.0).animate(_curvedAnimation)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           _controller.reverse();
//         } else if (status == AnimationStatus.dismissed) {
//           _controller.forward();
//         }
//       });
//     _controller.forward();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(painter: _CirclesPainter(_animation.value));
//   }
// }

// class _CirclesPainter extends CustomPainter {
//   final double offsetY;

//   _CirclesPainter(this.offsetY);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = Color(0xFF5887A9);

//     canvas.drawCircle(
//         Offset(size.width * 0.1, (offsetY + size.height) * 0.55), 5, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.15, (- offsetY + size.height) * 0.9), 8, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.2, offsetY + size.height * 0.3), 8, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.3, (- offsetY + size.height) * 0.5), 10, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.4, offsetY + size.height * 0.1), 5, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.45, offsetY + size.height * 0.8), 4, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.5, offsetY + size.height * 0.4), 8, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.6, (- offsetY + size.height) * 0.9), 10, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.62, - offsetY + size.height * 0.2), 4, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.75, (- offsetY + size.height) * 0.6), 6, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.8, offsetY + size.height * 0.1), 4, paint);
//     canvas.drawCircle(
//         Offset(size.width * 0.9, - offsetY + size.height * 0.6), 9, paint);
//   }

//   @override
//   bool shouldRepaint(_CirclesPainter oldDelegate) {
//     return oldDelegate.offsetY != offsetY;
//   }
// }
