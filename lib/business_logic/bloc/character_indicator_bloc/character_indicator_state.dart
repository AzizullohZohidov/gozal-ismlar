part of 'character_indicator_bloc.dart';

abstract class CharacterIndicatorState extends Equatable {
  const CharacterIndicatorState();

  @override
  List<Object> get props => [];
}

class CharacterIndicatorInitial extends CharacterIndicatorState {}

class CharacterIndicatorLetterChanging extends CharacterIndicatorState {
  final String newLetter;

  const CharacterIndicatorLetterChanging({required this.newLetter});

  @override
  List<Object> get props => [newLetter];
}

class CharacterIndicatorEmptyState extends CharacterIndicatorState {
  const CharacterIndicatorEmptyState();

  @override
  List<Object> get props => [];
}
