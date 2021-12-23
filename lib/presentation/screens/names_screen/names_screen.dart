import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/name_list_tile.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/search_bar.dart';

class NamesScreen extends StatefulWidget {
  NamesScreen({Key? key}) : super(key: key);
  bool maleNamesFilter = true;
  TextEditingController _searchBarController = TextEditingController();

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          _buildMaleFemaleNamesTabs(),
          SearchBar(
            searchBarController: widget._searchBarController,
            padding: 16.0,
          ),
          NameListTile(
            title: 'Абд',
            subTitle: 'Abd',
            isFavorite: true,
          ),
          NameListTile(
            title: 'Аббос',
            subTitle: 'Abbos',
          ),
        ],
      ),
    );
  }

  Widget _buildMaleFemaleNamesTabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 32,
        horizontal: 16.0,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: MyColors.lightGrey,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: MyColors.grey),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Row(
            children: [
              Expanded(child: _buildMaleNamesTab()),
              Expanded(child: _buildFemaleNamesTab()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMaleNamesTab() {
    return GestureDetector(
      onTap: () {
        widget._searchBarController.clear();
        setState(() {
          widget.maleNamesFilter = true;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              widget.maleNamesFilter
                  ? MyColors.darkGreen
                  : MyColors.transparent,
              widget.maleNamesFilter
                  ? MyColors.lightGreen
                  : MyColors.transparent,
            ],
          ),
        ),
        child: Text(
          "Болалар исми",
          style: TextStyle(
            color: widget.maleNamesFilter ? MyColors.white : MyColors.black,
          ),
        ),
      ),
    );
  }

  Widget _buildFemaleNamesTab() {
    return GestureDetector(
      onTap: () {
        widget._searchBarController.clear();
        setState(() {
          widget.maleNamesFilter = false;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              !widget.maleNamesFilter
                  ? MyColors.darkGreen
                  : MyColors.transparent,
              !widget.maleNamesFilter
                  ? MyColors.lightGreen
                  : MyColors.transparent,
            ],
          ),
        ),
        child: Text(
          "Қизлар исми",
          style: TextStyle(
            color: !widget.maleNamesFilter ? MyColors.white : MyColors.black,
          ),
        ),
      ),
    );
  }
}
