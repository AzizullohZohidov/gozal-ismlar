class NameModel {
  final int id;
  final String name;
  final String nameInLatin;
  final String meaning;
  final String peopleWithThisName;
  bool isFavorite;

  NameModel({
    required this.id,
    required this.name,
    required this.nameInLatin,
    required this.meaning,
    required this.peopleWithThisName,
    this.isFavorite = false,
  });
}
