import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_state.freezed.dart';

@freezed
abstract class CreateEventState with _$CreateEventState {
  const factory CreateEventState({
    required DateTime eventTime,
    required Duration alarmTime,
    @Default(false) bool isLoading,
  }) = _CreateEventState;

  const CreateEventState._();

  factory CreateEventState.init({int alarmTime = 5}) {
    final now = DateTime.now();

    return CreateEventState(
      eventTime: now.copyWith(minute: 0),
      alarmTime: Duration(minutes: alarmTime),
    );
  }
}
