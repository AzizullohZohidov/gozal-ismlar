part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}

class SearchInitializing extends SearchState {
  final List<String> recentlySearchedNames;

  SearchInitializing({
    required this.recentlySearchedNames,
  });

  @override
  List<Object> get props => [recentlySearchedNames];
}

class SearchFiltering extends SearchState {
  final List<NameModel> filteredNames;
  final bool isReversed;

  SearchFiltering({
    required this.filteredNames,
    required this.isReversed,
  });

  @override
  List<Object> get props => [
        filteredNames,
        isReversed,
      ];
}

class SearchClearing extends SearchState {
  SearchClearing();

  @override
  List<Object> get props => [];
}

class SearchEmpty extends SearchState {
  const SearchEmpty();

  @override
  List<Object> get props => [];
}
