import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/repositories/event_repository.dart';

class FindUpcomingEventsUseCase {
  const FindUpcomingEventsUseCase(this._eventRepository);

  final EventRepository _eventRepository;

  Future<List<EventEntity>> execute({
    required DateTime start,
    required DateTime end,
    int? limit,
  }) {
    return _eventRepository.findUpcomingEvents(start, end, limit: limit);
  }
}
