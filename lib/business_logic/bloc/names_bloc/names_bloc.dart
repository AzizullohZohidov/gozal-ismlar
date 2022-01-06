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
    on<NamesSetAlphabet>(_onNamesSetAlphabet);
  }

  _onNamesInitialized(
    NamesInitialized event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> maleNames = namesRepository.getAllNames(true);
    List<NameModel> femaleNames = namesRepository.getAllNames(false);
    double maleNamesOffset = 0.0;
    double femaleNamesOffset = 0.0;

    if (event.startingLetter != 'А') {
      int itemsPassed = maleNames.indexWhere(
              (name) => name.nameCyr.startsWith(event.startingLetter)) +
          1;

      maleNamesOffset = itemsPassed * event.tileHeight;

      itemsPassed = femaleNames.indexWhere(
              (name) => name.nameCyr.startsWith(event.startingLetter)) +
          1;

      femaleNamesOffset = itemsPassed * event.tileHeight;
    }
    /*for (NameModel name in femaleNames) {
      print('''
      ${name.nameCyr},
      ${name.isMaleName},
      ''');
    }*/

    print('male offset $maleNamesOffset');
    print('female offset $femaleNamesOffset');

    emit(NamesInitializing(
      maleNames: maleNames,
      femaleNames: femaleNames,
      maleNamesOffset: maleNamesOffset,
      femaleNamesOffset: femaleNamesOffset,
      isReversed: event.isReversed,
    ));
  }

  _onNamesFiltered(
    NamesFiltered event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> filteredNames = namesRepository.getNamesStartingWith(
      event.pattern,
    );
    emit(NamesFiltering(filteredNames: filteredNames));
  }

  _onNamesSetAlphabet(
    NamesSetAlphabet event,
    Emitter<NamesState> emit,
  ) {
    emit(NamesSettingAlphabet());
  }
}
