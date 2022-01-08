import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/names_bloc/names_bloc.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';

class LetterTile extends StatelessWidget {
  LetterTile({
    Key? key,
    required this.letter,
    required this.tileHeight,
    this.fontSize = 22,
  }) : super(key: key);
  final String letter;
  final double tileHeight;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tileHeight,
      child: Column(
        children: [
          ListTile(
            onTap: () {
              BlocProvider.of<NamesBloc>(context).add(NamesLetterChosen(letter: letter));
            },
            title: Text(
              letter,
              style: TextStyle(
                color: MyColors.black,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}
