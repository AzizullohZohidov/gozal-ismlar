import 'package:gozal_ismlar/data/data_providers/names_database.dart';

import '../models/name_model.dart';
import '../../dummy_data/dummy_data.dart';

class NamesRepository {
  late List<NameModel> allNames;
  late DummyData _dummyData;
  bool isInitialized = false;

  //Here goes initialization including fetching all names list and favorites list
  NamesRepository({required this.allNames}) {
    _dummyData = DummyData();
    //allNames = _dummyData.names;
  }

  List<NameModel> getAllNames(bool isMaleName) {
    return allNames
        .where((nameModel) => nameModel.isMaleName == isMaleName)
        .toList();
  }

  List<NameModel> getNamesStartingWith(String pattern, bool isMaleName) {
    return allNames
        .where((nameModel) => (nameModel.nameCyr.startsWith(pattern) &&
            nameModel.isMaleName == isMaleName))
        .toList();
  }

  List<NameModel> getFavoriteNames() {
    return allNames.where((nameModel) => nameModel.isFavorite).toList();
  }

  void markAsFavorite(int id) async {
    NameModel name;
    allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = true;
    name = allNames.firstWhere((nameModel) => nameModel.id == id);
    print('Marking as favorite name');
    await NamesDatabase.instance.markFavorite(name);
    print('Name ${name.nameCyr} has been favorited');
  }

  void unmarkFavorite(int id) async {
    NameModel name;
    allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = false;
    name = allNames.firstWhere((nameModel) => nameModel.id == id);
    print('Unmarking as favorite name');
    await NamesDatabase.instance.markFavorite(name);
    print('Name ${name.nameCyr} has been unfavorited');
  }
}
