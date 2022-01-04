import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/name_model.dart';
import '../../../data/repositories/names_repository.dart';
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
    List<NameModel> maleNames = namesRepository.getAllNames(true);
    List<NameModel> femaleNames = namesRepository.getAllNames(false);

    /*for (NameModel name in femaleNames) {
      print('''
      ${name.nameCyr},
      ${name.isMaleName},
      ''');
    }*/

    emit(NamesInitializing(
      maleNames: maleNames,
      femaleNames: femaleNames,
    ));
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
