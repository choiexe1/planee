import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/data_sources/event_data_source.dart';
import 'package:sqflite/sqflite.dart';

class LocalEventDataSource implements EventDataSource {
  const LocalEventDataSource(this._db);

  final Database _db;

  @override
  Future<List<EventDTO>> findAll() async {
    final List<Map<String, dynamic>> dtos = await _db.query('events');
    return dtos.map(EventDTO.fromJson).toList();
  }

  @override
  Future<EventDTO> findOne(int id) {
    throw UnimplementedError();
  }

  @override
  Future<void> create(EventDTO dto) async {
    await _db.insert('events', dto.toJson());
  }
}
