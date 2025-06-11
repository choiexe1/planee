import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/data_sources/event_data_source.dart';
import 'package:planee/domain/entities/event_entity.dart';
import 'package:sqflite/sqflite.dart';

class LocalEventDataSource implements EventDataSource {
  const LocalEventDataSource(this._db);

  final Database _db;

  @override
  Future<void> create(EventEntity entity) async {
    await _db.insert(
      'events',
      entity.toJson(),
    );
  }

  @override
  Future<List<EventDTO>> findAll() async {
    final List<Map<String, dynamic>> dtos = await _db.query('events');

    print(dtos);

    return [];
  }

  @override
  Future<EventDTO> findOne(int id) {
    throw UnimplementedError();
  }
}
