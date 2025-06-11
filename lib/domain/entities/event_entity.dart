import 'package:planee/domain/entities/tag_entity.dart';

class EventEntity {
  const EventEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.eventTime,
    required this.createdAt,
  });

  final int id;
  final String title;
  final String description;
  final DateTime eventTime;
  final DateTime createdAt;

  @override
  String toString() {
    return '''
    EventEntity{id: $id, title: $title, description: $description,
    eventTime: $eventTime, createdAt: $createdAt}
    ''';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is EventEntity &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.eventTime == eventTime &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    description,
    eventTime,
    createdAt,
  );

  EventEntity copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? eventTime,
    List<TagEntity>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
  }) {
    return EventEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      eventTime: eventTime ?? this.eventTime,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'eventTime': eventTime.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
