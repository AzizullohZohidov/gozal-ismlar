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

  NamesInitializing({
    required this.maleNames,
    required this.femaleNames,
  });

  @override
  List<Object?> get props => [
        maleNames,
        femaleNames,
      ];
}

class NamesFiltering extends NamesState {
  final List<NameModel> filteredNames;

  NamesFiltering({required this.filteredNames});

  @override
  List<Object?> get props => [filteredNames];
}
