part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class FavoritesInitialized extends FavoritesEvent {
  final bool isReversed;
  FavoritesInitialized({this.isReversed = false});

  @override
  List<Object> get props => [isReversed];
}
