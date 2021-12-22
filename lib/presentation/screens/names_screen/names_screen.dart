import 'package:flutter/material.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/name_list_tile.dart';

class NamesScreen extends StatefulWidget {
  NamesScreen({Key? key}) : super(key: key);
  bool maleNamesFilter = true;

  @override
  State<NamesScreen> createState() => _NamesScreenState();
}

class _NamesScreenState extends State<NamesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          _buildMaleFemaleNamesTabs(),
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
        child: Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
