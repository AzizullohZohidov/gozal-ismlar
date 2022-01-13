part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchInitialized extends SearchEvent {
  const SearchInitialized();

  @override
  List<Object> get props => [];
}

class SearchFiltered extends SearchEvent {
  final String pattern;

  SearchFiltered({
    required this.pattern,
  });

  @override
  List<Object> get props => [pattern];
}

class SearchBarEmptied extends SearchEvent {
  const SearchBarEmptied();

  @override
  List<Object> get props => [];
}

class SearchCleared extends SearchEvent {
  SearchCleared();

  @override
  List<Object> get props => [];
}

class SearchSaveSearched extends SearchEvent {
  final String name;

  SearchSaveSearched({required this.name});

  @override
  List<Object> get props => [name];
}
