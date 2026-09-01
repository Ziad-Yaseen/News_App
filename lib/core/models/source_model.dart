class SourceModel {
  final String id;
  final String name;

  new({required this.id, required this.name});

  factory SourceModel.fromJson(Map<String, dynamic> json) => SourceModel(
    id: json['id'] ?? 'unknown_source',
    name: json['name'] ?? 'Unknown Source',
  );
}
