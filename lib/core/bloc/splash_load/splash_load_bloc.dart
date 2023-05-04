import 'package:bloc/bloc.dart';

import 'splash_load_event.dart';
import 'splash_load_state.dart';

class Splash_loadBloc extends Bloc<Splash_loadEvent, Splash_loadState> {
  Splash_loadBloc() : super(Splash_loadState().init());

  @override
  Stream<Splash_loadState> mapEventToState(Splash_loadEvent event) async* {
    if (event is InitEvent) {
      yield await init();
    }
  }

  Future<Splash_loadState> init() async {
    return state.clone();
  }
}
