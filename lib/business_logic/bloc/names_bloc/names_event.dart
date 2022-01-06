part of 'names_bloc.dart';

@immutable
abstract class NamesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NamesInitialized extends NamesEvent {
  final bool isReversed;
  final double tileHeight;
  final String startingLetter;
  NamesInitialized({
    this.isReversed = false,
    this.tileHeight = 0.0,
    this.startingLetter = 'А',
  });

  @override
  List<Object?> get props => [
        isReversed,
        startingLetter,
      ];
}

class NamesFiltered extends NamesEvent {
  final bool isMaleName;
  final String pattern;

  NamesFiltered({
    required this.isMaleName,
    required this.pattern,
  });

  @override
  List<Object?> get props => [
        isMaleName,
        pattern,
      ];
}

class NamesSetAlphabet extends NamesEvent {
  NamesSetAlphabet();

  @override
  List<Object?> get props => [];
}
