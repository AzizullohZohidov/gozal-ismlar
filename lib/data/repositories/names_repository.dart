import 'package:gozal_ismlar/data/data_providers/names_database.dart';

import '../models/name_model.dart';
import '../../dummy_data/dummy_data.dart';

class NamesRepository {
  late List<int> _favoiteNameIds;
  late List<NameModel> allNames;
  late DummyData _dummyData;
  bool isInitialized = false;

  //Here goes initialization including fetching all names list and favorites list
  NamesRepository({required this.allNames}) {
    _dummyData = DummyData();
    _favoiteNameIds = [];
    //allNames = _dummyData.names;
  }

  //Not used
  Future<void> init() async {
    if (!isInitialized) {
      allNames = await NamesDatabase.instance.readAllNames();
      isInitialized = true;
    }
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
    return allNames
        .where((nameModel) => _favoiteNameIds.contains(nameModel.id))
        .toList();
  }

  void markAsFavorite(int id) {
    allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = true;
    _favoiteNameIds.add(id);
  }

  void unmarkFavorite(int id) {
    allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = false;
    _favoiteNameIds.remove(id);
  }
}
