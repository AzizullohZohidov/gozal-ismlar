import 'package:flutter/material.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/presentation/screens/search_screen/widgets/recently_searched_tile.dart';

class RecentlySearched extends StatelessWidget {
  RecentlySearched(
      {Key? key,
      required this.recentlySearchedNames,
      required this.searchBarController})
      : super(key: key);

  List<String> recentlySearchedNames;
  final TextEditingController searchBarController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: recentlySearchedNames.length,
      itemBuilder: (BuildContext context, int index) {
        return RecentlySearchedTile(
          key: Key(recentlySearchedNames[index]),
          searchBarController: searchBarController,
          title: recentlySearchedNames[index],
        );
      },
    );
  }
}
