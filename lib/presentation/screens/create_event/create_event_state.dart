import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_state.freezed.dart';

@freezed
abstract class CreateEventState with _$CreateEventState {
  const factory CreateEventState({
    @Default(false) bool isLoading,
    @Default(null) DateTime? eventTime,
    @Default(null) Duration? alarmTime,
    @Default(TimeOfDay(hour: 0, minute: 0)) TimeOfDay timeOfDay,
  }) = _CreateEventState;
}
