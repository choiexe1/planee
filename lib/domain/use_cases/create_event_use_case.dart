import 'package:planee/domain/repositories/event_repository.dart';

class CreateEventUseCase {
  const CreateEventUseCase(this._eventRepository);

  final EventRepository _eventRepository;

  Future<void> execute(
    String title,
    String description,
    DateTime eventTime,
  ) async {
    await _eventRepository.create(title, description, eventTime);
  }
}
