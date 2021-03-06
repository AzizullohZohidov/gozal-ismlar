import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gozal_ismlar/core/constants/curr_lang.dart';
import '../../../data/models/name_model.dart';
import '../../../data/repositories/names_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  NamesRepository namesRepository;
  FavoritesBloc({required this.namesRepository}) : super(FavoritesInitial()) {
    on<FavoritesInitialized>(_onFavoritesInitialized);
  }
  _onFavoritesInitialized(
    FavoritesInitialized event,
    Emitter<FavoritesState> emitter,
  ) {
    List<NameModel> favoriteNames = namesRepository.getFavoriteNames();
    emitter(FavoritesInitializing(
      favoriteNames: favoriteNames,
      isReversed: !CurrLag.isCyr,
    ));
  }
}
