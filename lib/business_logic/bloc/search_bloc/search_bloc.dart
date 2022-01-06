import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gozal_ismlar/data/data_providers/recently_searched_database.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final NamesRepository namesRepository;
  SearchBloc({required this.namesRepository}) : super(SearchInitial()) {
    on<SearchInitialized>(_onSearchInitialized);
    on<SearchFiltered>(_onSearchFiltered);
    on<SearchCleared>(_onSearchCleared);
    on<SearchBarEmptied>(_onSearchBarEmptied);
  }

  _onSearchInitialized(
    SearchInitialized event,
    Emitter<SearchState> emit,
  ) async {
    List<String> recentlySearchedList =
        await RecentlySearchedDatabase.instance.readAllRecNames();
    emit(SearchInitializing(recentlySearchedNames: recentlySearchedList));
  }

  _onSearchFiltered(
    SearchFiltered event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchEmpty());
    if (event.pattern.isNotEmpty) {
      await RecentlySearchedDatabase.instance.addRecName(event.pattern);
    }
    List<NameModel> names = namesRepository.getNamesStartingWith(event.pattern);
    emit(SearchFiltering(filteredNames: names));
  }

  _onSearchBarEmptied(
    SearchBarEmptied event,
    Emitter<SearchState> emit,
  ) async {
    emit(const SearchEmpty());
    List<String> recentlySearchedList =
        await RecentlySearchedDatabase.instance.readAllRecNames();
    emit(SearchInitializing(recentlySearchedNames: recentlySearchedList));
  }

  _onSearchCleared(
    SearchCleared event,
    Emitter<SearchState> emit,
  ) async {
    await RecentlySearchedDatabase.instance.clearDb();
    emit(SearchClearing());
  }
}
