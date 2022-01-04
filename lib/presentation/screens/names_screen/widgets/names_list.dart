import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../../data/models/name_model.dart';
import 'name_list_tile.dart';

class NamesList extends StatelessWidget {
  final ScrollController _listController = ScrollController();
  //Make sure to set corrent values
  double listItemHeight = 80;
  String firstLetter = 'А';
  late CharacterIndicatorBloc characterIndicatorBloc;
  NamesList({
    Key? key,
    required this.names,
  }) : super(key: key) {
    _listController.addListener(observeFirstCharacters);
  }
  List<NameModel> names;
  @override
  Widget build(BuildContext context) {
    characterIndicatorBloc = BlocProvider.of<CharacterIndicatorBloc>(context);
    return ListView.builder(
        controller: _listController,
        itemCount: names.length,
        itemBuilder: (BuildContext context, int index) {
          return NameListTile(
            key: Key(names[index].id.toString()),
            id: names[index].id,
            title: names[index].nameCyr,
            subTitle: names[index].nameLat,
            filteredNames: names,
            isFavorite: names[index].isFavorite,
          );
        });
  }

  void observeFirstCharacters() {
    int index = (_listController.offset / listItemHeight).toInt();
    var newLetter = names[index].nameCyr[0];
    if (newLetter != firstLetter) {
      firstLetter = newLetter;
      characterIndicatorBloc
          .add(CharacterIndicatorLetterChanged(newLetter: firstLetter));
    }
  }
}
