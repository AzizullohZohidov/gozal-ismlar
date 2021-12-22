import 'package:flutter/material.dart';
import 'dart:ui';

class ColoredIcon extends StatelessWidget {
  const ColoredIcon({
    Key? key,
    required this.icon,
    required this.bottomLeftColor,
    required this.topRightColor,
    this.iconSize = 24,
  }) : super(key: key);
  final IconData icon;
  final Color bottomLeftColor;
  final Color topRightColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            bottomLeftColor,
            topRightColor,
          ],
          tileMode: TileMode.repeated,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        color: Colors.grey,
        size: iconSize,
      ),
    );
  }
}