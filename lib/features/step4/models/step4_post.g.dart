// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step4_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step4Post _$Step4PostFromJson(Map<String, dynamic> json) => Step4Post(
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      body: json['body'] as String,
      coverUrl: json['cover_url'] as String,
    );

Map<String, dynamic> _$Step4PostToJson(Step4Post instance) => <String, dynamic>{
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
      'cover_url': instance.coverUrl,
    };
