import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/data/mapper/event_mapper.dart';
import 'package:planee/domain/data_sources/event_data_source.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:planee/domain/repositories/event_repository.dart';

class LocalEventRepository implements EventRepository {
  const LocalEventRepository(this._dataSource);

  final EventDataSource _dataSource;

  @override
  Future<List<EventEntity>> findAll() async {
    final dtos = await _dataSource.findAll();
    return dtos.map((dto) => dto.toEntity()).toList();
  }

  @override
  Future<EventEntity> findOne(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> create(
    String title,
    String description,
    DateTime eventTime,
  ) async {
    final dto = EventDTO(
      title: title,
      description: description,
      eventTime: eventTime,
    );
    await _dataSource.create(dto);
  }

  @override
  Future<List<EventEntity>> findUpcomingEvents(
    DateTime start,
    DateTime end, {
    bool ascending = true,
    int? limit,
  }) async {
    final dtos = await _dataSource.findEventsByDateRange(
      start,
      end,
      ascending: ascending,
      limit: limit,
    );
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
