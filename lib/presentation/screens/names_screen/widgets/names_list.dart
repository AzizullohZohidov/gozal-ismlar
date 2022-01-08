import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../business_logic/bloc/character_indicator_bloc/character_indicator_bloc.dart';
import '../../../../data/models/name_model.dart';
import 'name_list_tile.dart';

class NamesList extends StatelessWidget {
  final ScrollController _listController = ScrollController();
  //Make sure to set correct values
  final double listItemHeight;
  String firstLetter = 'А';
  final bool isReversed;
  late CharacterIndicatorBloc characterIndicatorBloc;
  NamesList({
    Key? key,
    required this.names,
    required this.isReversed,
    required this.listItemHeight,
  })  :
        super(key: key) {
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
            isReversed: isReversed,
            title: names[index].nameCyr,
            subTitle: names[index].nameLat,
            filteredNames: names,
            isFavorite: names[index].isFavorite,
            listTileHeight: MediaQuery.of(context).size.height * 0.11,
          );
        });
  }

  void observeFirstCharacters() {
    int index = (_listController.offset / listItemHeight).toInt();
    var newLetter = names[index].nameCyr[0];
    if (newLetter != firstLetter) {
      firstLetter = newLetter;
      characterIndicatorBloc
          .add(CharacterIndicatorLetterChanged(newLetter: newLetter));
    }
  }
}
