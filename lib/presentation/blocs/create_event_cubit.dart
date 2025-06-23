import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_push_notifications_module/domain/use_cases/scheduled_push_use_case.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit(this._createEventUseCase, this._scheduledPushUseCase)
    : super(const CreateEventState());

  final CreateEventUseCase _createEventUseCase;
  final ScheduledPushUseCase _scheduledPushUseCase;

  Future<void> onAction(CreateEventAction action) async {
    switch (action) {
      case SaveEvent(
        :final String title,
        :final String description,
        :final String location,
      ):
        await _createEvent(title, description, location);
      case ChangeTime(:final TimeOfDay timeOfDay):
        _changeTime(timeOfDay);
      case SaveAlarmTime(:final Duration alarmTime):
        _changeAlarmTime(alarmTime);
    }
  }

  void init(DateTime dateTime) {
    final nowTime = TimeOfDay.now();

    emit(
      state.copyWith(
        eventTime: dateTime,
        timeOfDay: nowTime.replacing(minute: 0),
      ),
    );
  }

  Future<void> _createEvent(
    String title,
    String description,
    String location,
  ) async {
    emit(state.copyWith(isLoading: true));

    final eventTime = state.eventTime!;

    await _createEventUseCase.execute(
      title,
      description,
      location,
      eventTime,
    );

    final alarmTime = eventTime.subtract(state.alarmTime!);

    await _scheduledPushUseCase.execute(
      id: 1,
      title: '알람',
      body: '알람 테스트',
      dateTime: alarmTime,
    );
  }

  void _changeTime(TimeOfDay timeOfDay) {
    final eventTime = state.eventTime!;

    emit(
      state.copyWith(
        timeOfDay: timeOfDay,
        eventTime: DateTime(
          eventTime.year,
          eventTime.month,
          eventTime.day,
          timeOfDay.hour,
          timeOfDay.minute,
        ),
      ),
    );
  }

  void _changeAlarmTime(Duration alarmTime) {
    emit(state.copyWith(alarmTime: alarmTime));
  }
}
