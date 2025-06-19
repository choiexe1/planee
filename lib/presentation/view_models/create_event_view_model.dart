import 'package:flutter/material.dart';
import 'package:local_push_notifications_module/domain/use_cases/scheduled_push_use_case.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';

class CreateEventViewModel with ChangeNotifier {
  CreateEventViewModel(this._createEventUseCase, this._scheduledPushUseCase);

  CreateEventState _state = const CreateEventState();

  final CreateEventUseCase _createEventUseCase;
  final ScheduledPushUseCase _scheduledPushUseCase;

  CreateEventState get state => _state;

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

    _state = _state.copyWith(
      eventTime: dateTime,
      timeOfDay: nowTime.replacing(minute: 0),
    );
  }

  Future<void> _createEvent(
    String title,
    String description,
    String location,
  ) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final eventTime = _state.eventTime!;

    await _createEventUseCase.execute(
      title,
      description,
      location,
      eventTime,
    );

    final alarmTime = eventTime.subtract(_state.alarmTime!);

    await _scheduledPushUseCase.execute(
      id: 1,
      title: '알람',
      body: '알람 테스트',
      dateTime: alarmTime,
    );

    notifyListeners();
  }

  void _changeTime(TimeOfDay timeOfDay) {
    final eventTime = _state.eventTime!;

    _state = _state.copyWith(
      timeOfDay: timeOfDay,
      eventTime: DateTime(
        eventTime.year,
        eventTime.month,
        eventTime.day,
        timeOfDay.hour,
        timeOfDay.minute,
      ),
    );

    notifyListeners();
  }

  void _changeAlarmTime(Duration alarmTime) {
    _state = _state.copyWith(alarmTime: alarmTime);
    notifyListeners();
  }
}
