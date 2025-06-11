class TagEntity {
  TagEntity({required this.name, required this.createdAt});

  final String name;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
