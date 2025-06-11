import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/repositories/repository.dart';

abstract interface class EventRepository
    implements Repository<EventEntity, int, EventDTO> {}
