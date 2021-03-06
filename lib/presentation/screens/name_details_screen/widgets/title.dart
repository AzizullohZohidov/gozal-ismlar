import 'package:flutter/material.dart';
import '../../../../core/constants/my_colors.dart';

class Title extends StatelessWidget {
  const Title({
    Key? key,
    required this.text,
    this.fontSize = 36,
    this.isBold = true,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final bool isBold;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: MyColors.black,
        fontSize: fontSize,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      ),
    );
  }
}
