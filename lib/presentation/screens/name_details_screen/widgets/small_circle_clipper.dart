import 'package:flutter/cupertino.dart';

class SmallCircleClipper extends CustomClipper<Path> {
  /*@override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.width / 6);
    var start = Offset(size.width / 2, size.height * 1.35);
    var end = Offset(size.width, size.height - size.width / 6);
    path.quadraticBezierTo(start.dx, start.dy, end.dx, end.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }*/

  SmallCircleClipper(this.difference);
  double difference;

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.width / 6);
    var start = Offset(size.width / 2, size.height * (1.35 + difference));
    var end = Offset(size.width, size.height - size.width / 6);
    path.quadraticBezierTo(start.dx, start.dy, end.dx, end.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return oldClipper != this;
  }
}
