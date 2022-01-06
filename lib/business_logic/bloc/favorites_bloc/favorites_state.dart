part of 'favorites_bloc.dart';

abstract class FavoritesState extends Equatable {
  const FavoritesState();

  @override
  List<Object> get props => [];
}

class FavoritesInitial extends FavoritesState {}

class FavoritesInitializing extends FavoritesState {
  final List<NameModel> favoriteNames;
  final bool isReversed;

  const FavoritesInitializing({
    required this.favoriteNames,
    required this.isReversed,
  });

  @override
  List<Object> get props => [
        favoriteNames,
        isReversed,
      ];
}
