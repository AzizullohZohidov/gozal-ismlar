import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/name_details_bloc/name_details_bloc.dart';
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
    int firstPageIndex =
        filteredNames.indexWhere((nameModel) => nameModel.id == currentNameId);
    _pageController = PageController(initialPage: firstPageIndex);
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
      body: SafeArea(
        child: Column(
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
      ),
    );
  }

  Widget _buildAppBar(NameModel nameModel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
            child: Image.asset('assets/icons/back_arrow.png'),
          ),
        ),
        Row(
          children: [
            _buildAppBarAction(
                'assets/icons/share.png',
                const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 11,
                ),
                () {}),
            BlocBuilder<NameDetailsBloc, NameDetailsState>(
              buildWhen: (previous, current) {
                if (current is NameDetailsInitial) {
                  return true;
                } else if (current is NameDetailsMarkingFavorite) {
                  return true;
                } else if (current is NameDetailsUnmarkingFavorite) {
                  return true;
                }
                return false;
              },
              builder: (context, state) {
                if (state is NameDetailsMarkingFavorite &&
                    state.id == nameModel.id) {
                  return _buildAppBarAction(
                    'assets/icons/tanlangan.png',
                    const EdgeInsets.all(10),
                    () {
                      BlocProvider.of<NameDetailsBloc>(context)
                          .add(NameDetailsUnmarkedFavorite(id: nameModel.id));
                    },
                  );
                } else if (state is NameDetailsUnmarkingFavorite &&
                    state.id == nameModel.id) {
                  return _buildAppBarAction(
                    'assets/icons/tanlanmagan.png',
                    const EdgeInsets.all(10),
                    () {
                      BlocProvider.of<NameDetailsBloc>(context)
                          .add(NameDetailsMarkedFavorite(id: nameModel.id));
                    },
                  );
                }
                return _buildAppBarAction(
                  nameModel.isFavorite
                      ? 'assets/icons/tanlangan.png'
                      : 'assets/icons/tanlanmagan.png',
                  const EdgeInsets.all(10),
                  () {
                    nameModel.isFavorite
                        ? BlocProvider.of<NameDetailsBloc>(context)
                            .add(NameDetailsUnmarkedFavorite(id: nameModel.id))
                        : BlocProvider.of<NameDetailsBloc>(context)
                            .add(NameDetailsMarkedFavorite(id: nameModel.id));
                  },
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPageBody(BuildContext context, NameModel nameModel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            _buildAppBar(nameModel),
            _buildContent(context, nameModel),
          ],
        ),
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
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.065,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.225,
              child: Image.asset('assets/icons/keyingi_ism.png'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarAction(
      String pathToIcon, EdgeInsets padding, Function callback) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.only(right: 8.0),
          padding: padding,
          height: MediaQuery.of(context).size.width * 0.1,
          width: MediaQuery.of(context).size.width * 0.1,
          decoration: BoxDecoration(
            color: MyColors.lightGrey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(
            pathToIcon,
          ),
        ),
      ),
    );
  }
}
