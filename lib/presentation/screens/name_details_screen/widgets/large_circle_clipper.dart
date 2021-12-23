import 'package:flutter/cupertino.dart';

class LargeCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double heightOffset = 38;
    path.lineTo(0, size.height - size.width / 7 - heightOffset);
    var start = Offset(size.width / 2, size.height - heightOffset);
    var end = Offset(size.width, size.height - size.width / 7 - heightOffset);
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
