import 'package:flutter/material.dart';
import '../../../../core/constants/my_colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.searchBarController,
    required this.padding,
    required this.isMaleName,
    required this.requestNameFilter,
  }) : super(key: key);
  final TextEditingController searchBarController;
  final double padding;
  final bool isMaleName;
  final Function requestNameFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextField(
        controller: searchBarController,
        cursorColor: MyColors.green,
        textCapitalization: TextCapitalization.sentences,
        style: TextStyle(
          color: MyColors.darkGreen,
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
          filled: true,
          fillColor: MyColors.lightGrey,
          suffixText: ": :",
          suffixStyle: TextStyle(
            color: MyColors.darkGreen,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        onChanged: (String text) {
          requestNameFilter(isMaleName, text);
        },
      ),
    );
  }
}
