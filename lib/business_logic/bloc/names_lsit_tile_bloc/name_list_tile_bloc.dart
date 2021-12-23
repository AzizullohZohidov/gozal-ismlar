import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';

part 'name_list_tile_event.dart';
part 'name_list_tile_state.dart';

class NameListTileBloc extends Bloc<NameListTileEvent, NameListTileState> {
  NamesRepository namesRepository;
  NameListTileBloc({required this.namesRepository})
      : super(NameListTileInitial()) {
    on<NameListTileEnteredDetails>(_onNameListTileEnteredDetails);
    on<NameListTileMarkedFavorite>(_onNameListTileMarkedFavorite);
    on<NameListTileUnmarkedFavorite>(_onNameListTileUnmarkedFavorite);
  }

  _onNameListTileEnteredDetails(
    NameListTileEnteredDetails event,
    Emitter<NameListTileState> emitter,
  ) {
    emitter(NameListTileEnteringDetails());
  }

  _onNameListTileMarkedFavorite(
    NameListTileMarkedFavorite event,
    Emitter<NameListTileState> emitter,
  ) {
    namesRepository.markAsFavorite(event.id);
    emitter(NameListTileMarkingFavorite(event.id));
  }

  _onNameListTileUnmarkedFavorite(
    NameListTileUnmarkedFavorite event,
    Emitter<NameListTileState> emitter,
  ) {
    namesRepository.unmarkFavorite(event.id);
    emitter(NameListTileUnmarkingFavorite(event.id));
  }
}
