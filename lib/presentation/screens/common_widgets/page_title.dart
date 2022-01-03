import 'package:flutter/material.dart';
import '../../../core/constants/my_colors.dart';

class PageTitle extends StatelessWidget {
  PageTitle({
    Key? key,
    required this.text,
    this.horizontalPadding = 0,
  }) : super(key: key);
  String text;
  double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: horizontalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: MyColors.black,
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
