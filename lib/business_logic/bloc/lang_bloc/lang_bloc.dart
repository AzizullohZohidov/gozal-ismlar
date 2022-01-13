import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'lang_event.dart';
part 'lang_state.dart';

class LangBloc extends Bloc<LangEvent, LangState> {
  LangBloc() : super(LangInitial()) {
    on<LangChanged>(_onLangChanged);
  }

  _onLangChanged(LangChanged event, Emitter<LangState> emit) {
    emit(LangEmpty());
    emit(LangChanging());
  }
}
