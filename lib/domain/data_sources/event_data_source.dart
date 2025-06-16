import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/data_sources/data_source.dart';

abstract interface class EventDataSource implements DataSource<EventDTO, int> {
  Future<List<EventDTO>> findEventsByDateRange(
    DateTime start,
    DateTime end, {
    bool ascending = true,
  });
}
