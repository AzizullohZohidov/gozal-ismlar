import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/large_circle_clipper.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/small_circle_clipper.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/title.dart'
    as my_title;

class NameDetailsScreen extends StatelessWidget {
  const NameDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.appBarColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back,
            color: MyColors.black,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildContent(context),
          _buildNextNameButton(),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.025,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        children: const [
          my_title.Title(text: "Исм"),
        ],
      ),
    );
  }

  Widget _buildNextNameButton() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: pi,
          child: Opacity(
            opacity: 0.1,
            child: ClipPath(
              clipper: LargeCircleClipper(),
              child: Container(
                color: MyColors.green,
                height: 200,
              ),
            ),
          ),
        ),
        Transform.rotate(
          angle: pi,
          child: Opacity(
            opacity: 0.1,
            child: ClipPath(
              clipper: SmallCircleClipper(),
              child: Container(
                color: MyColors.green,
                height: 200,
                alignment: Alignment.center,
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Icon(
              Icons.arrow_upward_rounded,
              color: MyColors.green,
            ),
            const SizedBox(height: 10),
            Text(
              "Keyingin ism",
              style: TextStyle(
                color: MyColors.green,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
