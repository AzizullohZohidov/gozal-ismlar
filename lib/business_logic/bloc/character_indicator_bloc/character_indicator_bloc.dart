import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'character_indicator_event.dart';
part 'character_indicator_state.dart';

class CharacterIndicatorBloc
    extends Bloc<CharacterIndicatorEvent, CharacterIndicatorState> {
  CharacterIndicatorBloc() : super(CharacterIndicatorInitial()) {
    on<CharacterIndicatorLetterChanged>(_onCharacterIndicatorLetterChanged);
  }

  _onCharacterIndicatorLetterChanged(
    CharacterIndicatorLetterChanged event,
    Emitter<CharacterIndicatorState> emitter,
  ) {
    String newLetter = event.newLetter;
    emit(CharacterIndicatorLetterChanging(newLetter: newLetter));
  }
}
