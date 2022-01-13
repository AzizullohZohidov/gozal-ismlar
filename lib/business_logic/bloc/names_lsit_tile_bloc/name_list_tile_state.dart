part of 'name_list_tile_bloc.dart';

abstract class NameListTileState extends Equatable {
  const NameListTileState();

  @override
  List<Object> get props => [];
}

class NameListTileInitial extends NameListTileState {}

class NameListTileEnteringDetails extends NameListTileState {
  final int id;
  final Key key;

  const NameListTileEnteringDetails({
    required this.id,
    required this.key,
  });

  @override
  List<Object> get props => [id];
}

class NameListTileMarkingFavorite extends NameListTileState {
  final int id;

  const NameListTileMarkingFavorite(this.id);

  @override
  List<Object> get props => [id];
}

class NameListTileUnmarkingFavorite extends NameListTileState {
  final int id;

  const NameListTileUnmarkingFavorite(this.id);

  @override
  List<Object> get props => [id];
}

class NameListTileEmptyState extends NameListTileState {}
