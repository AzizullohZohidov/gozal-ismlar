part of 'name_details_bloc.dart';

abstract class NameDetailsState extends Equatable {
  const NameDetailsState();

  @override
  List<Object> get props => [];
}

class NameDetailsInitial extends NameDetailsState {}

class NameDetailsMarkingFavorite extends NameDetailsState {
  final int id;

  const NameDetailsMarkingFavorite({required this.id});

  @override
  List<Object> get props => [id];
}

class NameDetailsUnmarkingFavorite extends NameDetailsState {
  final int id;

  const NameDetailsUnmarkingFavorite({required this.id});

  @override
  List<Object> get props => [id];
}
