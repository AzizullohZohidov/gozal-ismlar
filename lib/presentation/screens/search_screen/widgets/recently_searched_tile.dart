import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gozal_ismlar/business_logic/bloc/search_bloc/search_bloc.dart';
import 'package:gozal_ismlar/core/constants/my_colors.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';

class RecentlySearchedTile extends StatelessWidget {
  RecentlySearchedTile({
    Key? key,
    required this.searchBarController,
    required this.title,
    this.fontSize = 22,
    this.iconSize = 16,
  }) : super(key: key);

  final TextEditingController searchBarController;
  final String title;
  final double fontSize;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            searchBarController.clear();
            searchBarController.value = searchBarController.value.copyWith(
              text: title,
              selection: TextSelection.collapsed(
                offset: title.length,
              ),
            );
            BlocProvider.of<SearchBloc>(context)
                .add(SearchFiltered(pattern: searchBarController.text));
          },
          title: Text(
            title,
            style: TextStyle(
              color: MyColors.black,
              fontSize: fontSize,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: _buildSizedIcon('assets/icons/link_to.png', iconSize),
          ),
        ),
        const Divider(
          indent: 20,
          endIndent: 20,
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
