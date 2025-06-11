import 'package:json_annotation/json_annotation.dart';

part 'tag_dto.g.dart';

@JsonSerializable()
class TagDTO {
  const TagDTO({required this.id, required this.name});

  factory TagDTO.fromJson(Map<String, dynamic> json) => _$TagDTOFromJson(json);

  final int id;
  final String name;
  Map<String, dynamic> toJson() => _$TagDTOToJson(this);
}
