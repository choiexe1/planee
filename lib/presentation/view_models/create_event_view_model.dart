import 'package:flutter/cupertino.dart';
import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/repositories/event_repository.dart';

class CreateEventViewModel with ChangeNotifier {
  CreateEventViewModel(this._localEventRepository);

  final EventRepository _localEventRepository;

  Future<void> createEvent(EventDTO dto) async {
    await _localEventRepository.create(dto);
  }
}
