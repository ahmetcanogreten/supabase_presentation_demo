import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'step3_post.g.dart';

@JsonSerializable()
class Step3Post extends Equatable {
  @JsonKey(name: 'owner_id')
  final String ownerId;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final String title;
  final String body;

  const Step3Post({
    required this.ownerId,
    required this.createdAt,
    required this.title,
    required this.body,
  });

  @override
  List<Object> get props => [ownerId, createdAt, title, body];

  factory Step3Post.fromJson(Map<String, dynamic> json) =>
      _$Step3PostFromJson(json);

  Map<String, dynamic> toJson() => _$Step3PostToJson(this);
}
