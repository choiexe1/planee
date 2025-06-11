import 'package:planee/domain/entities/tag_entity.dart';
import 'package:planee/domain/none.dart';

class EventEntity {
  EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.eventTime,
    required this.notificationTime,
    required this.tags,
    required this.location,
    required this.repeat,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
  });

  final int id;
  final String title;
  final String description;
  final DateTime eventTime;
  final List<TagEntity> tags;
  final None notificationTime;
  final None location;
  final None repeat;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime deletedAt;

  @override
  String toString() {
    return 'EventEntity{id: $id, title: $title, description: $description, eventTime: $eventTime, tags: $tags, notificationTime: $notificationTime, location: $location, repeat: $repeat}';
  }

  EventEntity copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? eventTime,
    List<TagEntity>? tags,
    None? notificationTime,
    None? location,
    None? repeat,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      eventTime: eventTime ?? this.eventTime,
      tags: tags ?? this.tags,
      notificationTime: notificationTime ?? this.notificationTime,
      location: location ?? this.location,
      repeat: repeat ?? this.repeat,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
