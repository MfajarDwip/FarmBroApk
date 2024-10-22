import 'package:flutter_bloc/flutter_bloc.dart';
part 'remote_event.dart';
part 'remote_state.dart';

class RemoteBloc extends Bloc<RemoteEvent, RemoteState> {
  RemoteBloc() : super(RemoteState(false)) {
    on<RemoteOnPressed>((event, emit) {
      emit(RemoteState(true));
    });
    on<RemoteOffPressed>((event, emit) {
      emit(RemoteState(false));
    });
  }
}
