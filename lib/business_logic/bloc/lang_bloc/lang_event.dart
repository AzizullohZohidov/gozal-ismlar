part of 'lang_bloc.dart';

abstract class LangEvent extends Equatable {
  const LangEvent();

  @override
  List<Object> get props => [];
}

class LangChanged extends LangEvent {
  const LangChanged();

  @override
  List<Object> get props => [];
}
