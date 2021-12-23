import 'package:flutter/cupertino.dart';

class SmallCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - size.width / 3);
    var start = Offset(size.width / 2, size.height);
    var end = Offset(size.width, size.height - size.width / 3);
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
