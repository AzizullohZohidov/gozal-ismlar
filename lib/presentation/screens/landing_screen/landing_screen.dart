import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/favorites_screen/favorites_screen.dart';
import 'package:gozal_ismlar/presentation/screens/info_screen/info_screen.dart';
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
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: screens[pageIndex],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: MyColors.appBarColor,
      elevation: 0,
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.375,
        child: Image.asset(
          'assets/icons/gozal_ismlar_logo.png',
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            margin: const EdgeInsets.only(right: 12.0),
            padding: const EdgeInsets.only(
              bottom: 12.0,
              left: 10.0,
              top: 10.0,
              right: 12.0,
            ),
            height: MediaQuery.of(context).size.width * 0.1,
            width: MediaQuery.of(context).size.width * 0.1,
            decoration: BoxDecoration(
              color: MyColors.lightGrey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'assets/icons/search.png',
            ),
          ),
        ),
      ],
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
          icon: _buildSizedIcon('assets/icons/ismlar_unselected.png', 22),
          activeIcon: _buildSizedIcon('assets/icons/ismlar_selected.png', 22),
          label: 'Исмлар',
        ),
        BottomNavigationBarItem(
          icon: _buildSizedIcon('assets/icons/saralangan_unselected.png', 22),
          activeIcon:
              _buildSizedIcon('assets/icons/saralangan_selected.png', 22),
          label: 'Сараланган',
        ),
        BottomNavigationBarItem(
          icon: _buildSizedIcon('assets/icons/info_unselected.png', 22),
          activeIcon: _buildSizedIcon('assets/icons/info_selected.png', 22),
          label: 'Инфо',
        ),
      ],
    );
  }

  Widget _buildSizedIcon(String pathToIcon, double size) {
    return SizedBox(
      height: size,
      width: size,
      child: Image.asset(
        pathToIcon,
      ),
    );
  }
}
