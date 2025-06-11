import 'package:flutter/cupertino.dart';
import 'package:planee/domain/use_cases/create_event_use_case.dart';

class CreateEventViewModel with ChangeNotifier {
  CreateEventViewModel(this._createEventUseCase);

  final CreateEventUseCase _createEventUseCase;

  Future<void> createEvent(String title, String description) async {
    await _createEventUseCase.execute(title, description);
  }
}
