import 'package:planee/data/dto/event_dto.dart';
import 'package:planee/domain/entities/event_entity.dart';

extension EventMapper on EventDTO {
  EventEntity toEntity() {
    return EventEntity(
      title: title,
      description: description,
      id: id!,
      eventTime: eventTime,
      location: location,
      createdAt: createdAt,
    );
  }
}
