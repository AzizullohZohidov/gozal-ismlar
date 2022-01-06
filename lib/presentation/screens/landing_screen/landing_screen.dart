import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/favorites_bloc/favorites_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_bloc/names_bloc.dart';
import 'package:gozal_ismlar/presentation/screens/search_screen/search_screen.dart';
import '../../../core/constants/my_colors.dart';
import '../favorites_screen/favorites_screen.dart';
import '../info_screen/info_screen.dart';
import '../names_screen/names_screen.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  var pageIndex = 0;
  bool cyrill = false;

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
          child: GestureDetector(
            onTap: () {
              cyrill = !cyrill;
              BlocProvider.of<NamesBloc>(context).add(
                NamesInitialized(isReversed: cyrill),
              );
              BlocProvider.of<FavoritesBloc>(context).add(
                FavoritesInitialized(isReversed: cyrill),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(right: 4.0),
              padding: const EdgeInsets.only(
                bottom: 11.0,
                left: 9.0,
                top: 9.0,
                right: 11.0,
              ),
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                color: MyColors.statusBarIconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/icons/lang_switch.png',
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) => SearchScreen(),
                ),
              );
            },
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
                color: MyColors.statusBarIconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                'assets/icons/search.png',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      child: BottomNavigationBar(
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
      ),
    );
  }

  Widget _buildSizedIcon(String pathToIcon, double size) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9.0),
      child: SizedBox(
        height: size,
        width: size,
        child: Image.asset(
          pathToIcon,
        ),
      ),
    );
  }
}
