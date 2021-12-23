part of 'names_bloc.dart';

@immutable
abstract class NamesState extends Equatable {}

class NamesInitial extends NamesState {
  @override
  List<Object?> get props => [];
}

class NamesInitializing extends NamesState {
  final List<NameModel> allNames;

  NamesInitializing({required this.allNames});

  @override
  List<Object?> get props => [allNames];
}

class NamesFiltering extends NamesState {
  final List<NameModel> filteredNames;

  NamesFiltering({required this.filteredNames});

  @override
  List<Object?> get props => [filteredNames];
}
