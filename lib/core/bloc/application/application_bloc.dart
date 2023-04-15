import 'package:bloc/bloc.dart';

import 'application_event.dart';
import 'application_state.dart';

class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
  ApplicationBloc() : super(ApplicationState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ApplicationState> emit) async {
    emit(state.clone());
  }
}
