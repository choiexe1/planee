import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/repositories/repository.dart';

abstract interface class EventRepository
    implements Repository<EventEntity, int> {
  Future<void> create(String title, String description);
}
