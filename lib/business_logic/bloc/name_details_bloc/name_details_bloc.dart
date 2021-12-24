import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';

part 'name_details_event.dart';
part 'name_details_state.dart';

class NameDetailsBloc extends Bloc<NameDetailsEvent, NameDetailsState> {
  NamesRepository namesRepository;
  NameDetailsBloc({required this.namesRepository})
      : super(NameDetailsInitial()) {
    on<NameDetailsMarkedFavorite>(_onNameDetailsMarkedFavorite);
    on<NameDetailsUnmarkedFavorite>(_onNameDetailsUnmarkedFavorite);
  }

  _onNameDetailsMarkedFavorite(
    NameDetailsMarkedFavorite event,
    Emitter<NameDetailsState> emitter,
  ) {
    namesRepository.markAsFavorite(event.id);
    emitter(NameDetailsMarkingFavorite(id: event.id));
  }

  _onNameDetailsUnmarkedFavorite(
    NameDetailsUnmarkedFavorite event,
    Emitter<NameDetailsState> emitter,
  ) {
    namesRepository.unmarkFavorite(event.id);
    emitter(NameDetailsUnmarkingFavorite(id: event.id));
  }
}
