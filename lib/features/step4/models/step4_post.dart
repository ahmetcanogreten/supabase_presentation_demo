import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step4_post.g.dart';

@JsonSerializable()
class Step4Post extends Equatable {
  @JsonKey(name: 'owner_id')
  final String ownerId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String title;
  final String body;

  @JsonKey(name: 'cover_url')
  final String coverUrl;

  const Step4Post({
    required this.ownerId,
    required this.createdAt,
    required this.title,
    required this.body,
    required this.coverUrl,
  });

  @override
  List<Object> get props => [ownerId, createdAt, title, body, coverUrl];

  factory Step4Post.fromJson(Map<String, dynamic> json) =>
      _$Step4PostFromJson(json);

  Map<String, dynamic> toJson() => _$Step4PostToJson(this);
}
