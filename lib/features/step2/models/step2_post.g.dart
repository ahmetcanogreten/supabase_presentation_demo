// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step2_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step2Post _$Step2PostFromJson(Map<String, dynamic> json) => Step2Post(
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$Step2PostToJson(Step2Post instance) => <String, dynamic>{
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
    };
