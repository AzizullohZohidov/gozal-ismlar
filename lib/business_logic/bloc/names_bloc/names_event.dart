part of 'names_bloc.dart';

@immutable
abstract class NamesEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class NamesInitialized extends NamesEvent {
  final bool isMaleName;

  NamesInitialized({
    required this.isMaleName,
  });

  @override
  List<Object?> get props => [
        isMaleName,
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
