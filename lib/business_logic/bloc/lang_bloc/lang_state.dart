part of 'lang_bloc.dart';

abstract class LangState extends Equatable {
  const LangState();

  @override
  List<Object> get props => [];
}

class LangInitial extends LangState {}

class LangChanging extends LangState {}

class LangEmpty extends LangState {}
