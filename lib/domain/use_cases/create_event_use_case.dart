import 'package:planee/domain/repositories/event_repository.dart';

class CreateEventUseCase {
  const CreateEventUseCase(this._eventRepository);

  final EventRepository _eventRepository;

  Future<void> execute(
    String title,
    String description,
    String location,
    DateTime eventTime,
  ) async {
    await _eventRepository.create(
      title,
      description,
      location,
      eventTime,
    );
  }
}
