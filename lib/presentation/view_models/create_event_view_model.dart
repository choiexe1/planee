import 'package:flutter/material.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';
import 'package:planee/presentation/screens/create_event/create_event_state.dart';

class CreateEventViewModel with ChangeNotifier {
  CreateEventViewModel(this._createEventUseCase);

  CreateEventState _state = const CreateEventState();

  final CreateEventUseCase _createEventUseCase;

  CreateEventState get state => _state;

  Future<void> onAction(CreateEventAction action) async {
    switch (action) {
      case SaveEvent(:final String title, :final String description):
        await _createEvent(title, description);
      case ChangeTime(:final TimeOfDay timeOfDay):
        _changeTime(timeOfDay);
    }
  }

  void init(DateTime dateTime) {
    _state = _state.copyWith(eventTime: dateTime);
  }

  Future<void> _createEvent(
    String title,
    String description,
  ) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    await _createEventUseCase.execute(title, description, _state.eventTime!);
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
}
