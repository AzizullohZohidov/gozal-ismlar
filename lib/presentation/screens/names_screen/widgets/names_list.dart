import 'package:flutter/material.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/presentation/screens/names_screen/widgets/name_list_tile.dart';

class NamesList extends StatelessWidget {
  NamesList({
    Key? key,
    required this.names,
  }) : super(key: key);
  List<NameModel> names;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return NameListTile(
            key: Key(names[index].id.toString()),
            id: names[index].id,
            title: names[index].name,
            subTitle: names[index].nameInLatin,
            isFavorite: names[index].isFavorite,
          );
        });
  }
}
