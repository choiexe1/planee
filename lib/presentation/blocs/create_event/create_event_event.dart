import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_event.freezed.dart';

@freezed
sealed class CreateEventEvent with _$CreateEventEvent {
  const factory CreateEventEvent.changeEventTime(TimeOfDay timeOfDay) =
      CreateEventChangeEventTime;
  const factory CreateEventEvent.saveAlarmTime(Duration alarmTime) =
      CreateEventSaveAlarmTime;
  const factory CreateEventEvent.saveEvent({
    required String title,
    required String description,
    required String location,
  }) = CreateEventSaveEvent;
}
