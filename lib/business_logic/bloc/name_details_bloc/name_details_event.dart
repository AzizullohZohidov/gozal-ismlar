part of 'name_details_bloc.dart';

abstract class NameDetailsEvent extends Equatable {
  const NameDetailsEvent();

  @override
  List<Object> get props => [];
}

class NameDetailsMarkedFavorite extends NameDetailsEvent {
  final int id;

  const NameDetailsMarkedFavorite({required this.id});

  @override
  List<Object> get props => [id];
}

class NameDetailsUnmarkedFavorite extends NameDetailsEvent {
  final int id;

  const NameDetailsUnmarkedFavorite({required this.id});

  @override
  List<Object> get props => [id];
}
