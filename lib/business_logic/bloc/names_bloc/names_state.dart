part of 'names_bloc.dart';

@immutable
abstract class NamesState extends Equatable {}

class NamesInitial extends NamesState {
  @override
  List<Object?> get props => [];
}

class NamesInitializing extends NamesState {
  final List<NameModel> maleNames;
  final List<NameModel> femaleNames;
  final bool isReversed;

  NamesInitializing({
    required this.maleNames,
    required this.femaleNames,
    this.isReversed = false,
  });

  NamesInitializing copyWith(List<NameModel>? maleNames, List<NameModel>? femaleNames, bool? isReversed,) {
    return NamesInitializing(
      maleNames: maleNames ?? this.maleNames,
      femaleNames: femaleNames ?? this.femaleNames,
      isReversed: isReversed ?? this.isReversed,
    );
  }

  @override
  List<Object?> get props => [
        maleNames,
        femaleNames,
        isReversed,
      ];
}

class NamesFiltering extends NamesState {
  final List<NameModel> filteredNames;

  NamesFiltering({required this.filteredNames});

  @override
  List<Object?> get props => [filteredNames];
}

class NamesSettingAlphabet extends NamesState {
  NamesSettingAlphabet();

  @override
  List<Object?> get props => [];
}

class NamesFilteredByLetter extends NamesState {
  final List<NameModel> filteredMaleNames;
  final List<NameModel> filteredFemaleNames;
  final bool isReversed;
  
  NamesFilteredByLetter({
    required this.filteredMaleNames,
    required this.filteredFemaleNames,
    required this.isReversed,
  });

  NamesFilteredByLetter copyWith(List<NameModel>? maleNames, List<NameModel>? femaleNames, bool? isReversed,) {
    return NamesFilteredByLetter(
      filteredMaleNames: maleNames ?? this.filteredMaleNames,
      filteredFemaleNames: femaleNames ?? this.filteredFemaleNames,
      isReversed: isReversed ?? this.isReversed,
    );
  }

  @override
  List<Object?> get props => [filteredMaleNames, filteredFemaleNames, isReversed];
}
