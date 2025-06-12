import 'package:flutter/cupertino.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';
import 'package:planee/presentation/screens/create_event/create_event_action.dart';

class CreateEventViewModel with ChangeNotifier {
  CreateEventViewModel(this._createEventUseCase);

  final CreateEventUseCase _createEventUseCase;

  Future<void> onAction(CreateEventAction action) async {
    switch (action) {
      case SaveEvent(:final String title, :final String description):
        await _createEvent(title, description);
    }
  }

  Future<void> _createEvent(String title, String description) async {
    await _createEventUseCase.execute(title, description);
  }
}
