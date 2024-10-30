part of 'remote_bloc.dart';

class RemoteState {
  final bool condition;

  RemoteState({
    this.condition = false,
  });

  RemoteState copyWith({
    bool? condition,
  }) {
    return RemoteState(
      condition: condition ?? this.condition,
    );
  }
}
