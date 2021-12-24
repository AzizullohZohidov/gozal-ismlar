part of 'character_indicator_bloc.dart';

abstract class CharacterIndicatorEvent extends Equatable {
  const CharacterIndicatorEvent();

  @override
  List<Object> get props => [];
}

class CharacterIndicatorLetterChanged extends CharacterIndicatorEvent {
  final String newLetter;

  const CharacterIndicatorLetterChanged({required this.newLetter});

  @override
  List<Object> get props => [newLetter];
}
