import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_event_action.freezed.dart';

@freezed
sealed class CreateEventAction with _$CreateEventAction {
  const factory CreateEventAction.saveEvent({
    required String title,
    required String description,
    required String location,
  }) = SaveEvent;

  const factory CreateEventAction.changeTime({
    required TimeOfDay timeOfDay,
  }) = ChangeTime;
}
