import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/large_circle_clipper.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/small_circle_clipper.dart';
import 'package:gozal_ismlar/presentation/screens/name_details_screen/widgets/title.dart'
    as my_title;

class NameDetailsScreen extends StatefulWidget {
  NameDetailsScreen({
    Key? key,
    required this.filteredNames,
    required this.currentNameId,
  }) : super(key: key) {
    _pageController = PageController(initialPage: currentNameId);
  }
  late PageController _pageController;
  List<NameModel> filteredNames;
  int currentNameId;

  @override
  State<NameDetailsScreen> createState() => _NameDetailsScreenState();
}

class _NameDetailsScreenState extends State<NameDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: widget._pageController,
              itemCount: widget.filteredNames.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return _buildPageBody(context, widget.filteredNames[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.appBarColor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: MyColors.black,
        ),
      ),
    );
  }

  Widget _buildPageBody(BuildContext context, NameModel nameModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContent(context, nameModel),
        _buildNextNameButton(),
      ],
    );
  }

  Widget _buildContent(BuildContext context, NameModel nameModel) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.025,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          my_title.Title(text: nameModel.name),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              nameModel.nameInLatin,
              style: TextStyle(
                fontSize: 16,
                height: 2,
                color: MyColors.descriptionTextColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(
              nameModel.meaning,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.5,
              ),
            ),
          ),
          Text(
            nameModel.peopleWithThisName,
            style: const TextStyle(
              fontSize: 16,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextNameButton() {
    return GestureDetector(
      onTap: () {
        widget._pageController
            .nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
      },
      child: Stack(
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
                  alignment: Alignment.center,
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
      ),
    );
  }
}
