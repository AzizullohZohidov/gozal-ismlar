final String tableNames = 'names';

class NameFields {
  static final List<String> values = [
    id,
    nameLat,
    nameCyr,
    isMaleName,
    meaning,
    peopleWithThisName,
    isFavorite,
    comingLang,
  ];

  static final String id = '_id';
  static final String nameLat = 'nameLat';
  static final String nameCyr = 'nameCyr';
  static final String isMaleName = 'gender';
  static final String meaning = 'definition';
  static final String peopleWithThisName = 'namedPeople';
  static final String isFavorite = 'isLoved';
  static final String comingLang = 'comingLang';
}

class NameModel {
  final int id;
  final String nameLat;
  final String nameCyr;
  final bool isMaleName;
  final String meaning;
  final String peopleWithThisName;
  bool isFavorite;
  final String comingLang;

  NameModel({
    required this.id,
    required this.nameLat,
    required this.nameCyr,
    required this.isMaleName,
    required this.meaning,
    required this.peopleWithThisName,
    required this.comingLang,
    this.isFavorite = false,
  });

  static NameModel fromJson(Map<String, Object?> json, [int? id]) => NameModel(
        id: id ?? json[NameFields.id] as int,
        nameLat: json[NameFields.nameLat] as String,
        nameCyr: json[NameFields.nameCyr] as String,
        isMaleName: json[NameFields.isMaleName].toString() == "1",
        meaning: json[NameFields.meaning] as String,
        peopleWithThisName: json[NameFields.peopleWithThisName] == null
            ? ""
            : json[NameFields.peopleWithThisName] as String,
        comingLang: json[NameFields.comingLang] as String,
        isFavorite: json[NameFields.isFavorite] == 1,
      );

  Map<String, Object?> toJson() => {
        NameFields.id: id,
        NameFields.nameLat: nameLat,
        NameFields.nameCyr: nameCyr,
        NameFields.isMaleName: isMaleName ? 1 : 0,
        NameFields.meaning: meaning,
        NameFields.peopleWithThisName: peopleWithThisName,
        NameFields.isFavorite: isFavorite ? 1 : 0,
        NameFields.comingLang: comingLang,
      };
}
