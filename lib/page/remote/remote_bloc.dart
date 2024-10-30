import 'package:flutter_bloc/flutter_bloc.dart';

part 'remote_event.dart';
part 'remote_state.dart';

class RemoteBloc extends Bloc<RemoteEvent, RemoteState> {

  RemoteBloc() : super(RemoteState()) {
    on<RemoteOnPressed>((event, emit) {
      emit(state.copyWith(
        condition: true
      ));
    });
    on<RemoteOffPressed>((event, emit) {
      emit(state.copyWith(
        condition: false
      ));
    });
  }
}
