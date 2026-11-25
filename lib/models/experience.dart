import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.categoryDisplay,
    this.thumbnail,
    required this.startedAt,
    this.endedAt,
    required this.isOngoing,
    required this.starCount,
    required this.isStarred,
  });

  final String id;
  final String title;
  final String description;
  final String category;
  final String categoryDisplay;

  final String? thumbnail;

  @JsonKey(includeToJson: false)
  final DateTime startedAt;

  final DateTime? endedAt;

  @JsonKey(includeToJson: false)
  final bool isOngoing;

  @JsonKey(includeToJson: false)
  final int starCount;

  @JsonKey(includeToJson: false)
  final bool isStarred;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
