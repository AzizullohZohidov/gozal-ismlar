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
    on<NamesLetterChosen>(_onNamesLetterChosen);
    on<NamesLangChanged>(_onNamesLangChanged);
  }

  _onNamesInitialized(
    NamesInitialized event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> maleNames = namesRepository.getAllNames(true);
    List<NameModel> femaleNames = namesRepository.getAllNames(false);

    emit(NamesInitializing(
      maleNames: maleNames,
      femaleNames: femaleNames,
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

  _onNamesLetterChosen(
    NamesLetterChosen event,
    Emitter<NamesState> emit,
  ) {
    List<NameModel> filteredMaleNames = namesRepository.getNamesByFirstLetterAndGender(event.letter, true);
    List<NameModel> filteredFemaleNames = namesRepository.getNamesByFirstLetterAndGender(event.letter, false);
    emit(NamesFilteredByLetter(filteredMaleNames: filteredMaleNames, filteredFemaleNames: filteredFemaleNames, isReversed: false));
  }

  _onNamesLangChanged(
    NamesLangChanged event,
    Emitter<NamesState> emit,
  ) {
    print('Within NamesLangChanged handler');
    if(state is NamesInitializing){
      print('Last state was NamesInitializing');
      var currState = (state as NamesInitializing);
      var newState = currState.copyWith(null, null, !currState.isReversed);
      emit(newState);
    } else if(state is NamesFilteredByLetter){
      print('Last state was NamesFilteredByLetter');
      var currState = (state as NamesFilteredByLetter);
      var newState = currState.copyWith(null, null, !currState.isReversed);
      emit(newState);
    } else{
      emit(state);
    }
  }
}
