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
  final double maleNamesOffset;
  final double femaleNamesOffset;
  final bool isReversed;

  NamesInitializing({
    required this.maleNames,
    required this.femaleNames,
    this.maleNamesOffset = 0.0,
    this.femaleNamesOffset = 0.0,
    this.isReversed = false,
  });

  @override
  List<Object?> get props => [
        maleNames,
        femaleNames,
        maleNamesOffset,
        femaleNamesOffset,
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
