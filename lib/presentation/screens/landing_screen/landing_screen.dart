import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:gozal_ismlar/presentation/screens/info_screen/info_screen.dart';
import 'package:gozal_ismlar/presentation/screens/common_widgets/colored_icon.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/names_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var pageIndex = 0;

  final screens = [
    NamesScreen(),
    FavoritesScreen(),
    InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: screens[pageIndex],
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: pageIndex,
      onTap: (index) => setState(() {
        pageIndex = index;
      }),
      backgroundColor: MyColors.bottomNavBarColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedFontSize: 13,
      unselectedFontSize: 13,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.document_scanner_rounded),
          activeIcon: ColoredIcon(
            icon: Icons.document_scanner_rounded,
            bottomLeftColor: MyColors.darkGreen,
            topRightColor: MyColors.lightGreen,
          ),
          label: 'Исмлар',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.star_rounded),
          activeIcon: ColoredIcon(
            icon: Icons.star_rounded,
            bottomLeftColor: MyColors.darkGreen,
            topRightColor: MyColors.lightGreen,
          ),
          label: 'Сараланган',
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.info),
          activeIcon: ColoredIcon(
            icon: Icons.info,
            bottomLeftColor: MyColors.darkGreen,
            topRightColor: MyColors.lightGreen,
          ),
          label: 'Инфо',
        ),
      ],
    );
  }
}
