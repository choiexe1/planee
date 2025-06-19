import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDTO {
  EventDTO({
    required this.title,
    required this.description,
    required this.eventTime,
    required this.location,
    this.id,
  }) : createdAt = DateTime.now();

  factory EventDTO.fromJson(Map<String, dynamic> json) =>
      _$EventDTOFromJson(json);

  Map<String, dynamic> toJson() => _$EventDTOToJson(this);

  final int? id;
  final String title;
  final String description;
  final String location;
  final DateTime eventTime;
  final DateTime createdAt;
}
