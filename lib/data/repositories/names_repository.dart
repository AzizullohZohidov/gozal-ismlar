import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/dummy_data/dummy_data.dart';

class NamesRepository {
  late List<int> _favoiteNameIds;
  late List<NameModel> _allNames;
  late DummyData _dummyData;
  //Here goes initialization including fetching all names list and favorites list
  NamesRepository() {
    _dummyData = DummyData();
    _favoiteNameIds = [];
    _allNames = _dummyData.names;
  }

  List<NameModel> getAllNames() {
    return _allNames;
  }

  List<NameModel> getNamesStartingWith(String pattern) {
    return _allNames
        .where((nameModel) => nameModel.name.startsWith(pattern))
        .toList();
  }

  List<NameModel> getFavoriteNames() {
    return _allNames
        .where((nameModel) => _favoiteNameIds.contains(nameModel.id))
        .toList();
  }

  void markAsFavorite(int id) {
    _allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = true;
    _favoiteNameIds.add(id);
  }

  void unmarkFavorite(int id) {
    _allNames.firstWhere((nameModel) => nameModel.id == id).isFavorite = false;
    _favoiteNameIds.remove(id);
  }
}
