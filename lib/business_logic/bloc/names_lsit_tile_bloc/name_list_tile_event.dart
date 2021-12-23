part of 'name_list_tile_bloc.dart';

abstract class NameListTileEvent extends Equatable {
  const NameListTileEvent();

  @override
  List<Object> get props => [];
}

class NameListTileEnteredDetails extends NameListTileEvent {
  final int id;

  const NameListTileEnteredDetails({required this.id});

  @override
  List<Object> get props => [id];
}

class NameListTileMarkedFavorite extends NameListTileEvent {
  final int id;

  const NameListTileMarkedFavorite({required this.id});

  @override
  List<Object> get props => [id];
}

class NameListTileUnmarkedFavorite extends NameListTileEvent {
  final int id;

  const NameListTileUnmarkedFavorite({required this.id});

  @override
  List<Object> get props => [id];
}
