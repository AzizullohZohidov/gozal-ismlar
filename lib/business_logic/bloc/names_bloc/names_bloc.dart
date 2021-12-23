import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gozal_ismlar/data/models/name_model.dart';
import 'package:gozal_ismlar/data/repositories/names_repository.dart';
import 'package:meta/meta.dart';

part 'names_event.dart';
part 'names_state.dart';

class NamesBloc extends Bloc<NamesEvent, NamesState> {
  final NamesRepository namesRepository;
  NamesBloc({required this.namesRepository}) : super(NamesInitial()) {
    on<NamesInitialized>(_onNamesInitialized);
    on<NamesFiltered>(_onNamesFiltered);
  }

  _onNamesInitialized(
    NamesInitialized event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> allNames = namesRepository.getAllNames(event.isMaleName);
    emit(NamesInitializing(allNames: allNames));
  }

  _onNamesFiltered(
    NamesFiltered event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> filteredNames = namesRepository.getNamesStartingWith(
      event.pattern,
      event.isMaleName,
    );
    emit(NamesFiltering(filteredNames: filteredNames));
  }
}
