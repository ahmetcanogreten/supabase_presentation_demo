// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step3_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Step3Post _$Step3PostFromJson(Map<String, dynamic> json) => Step3Post(
      ownerId: json['owner_id'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      title: json['title'] as String,
      body: json['body'] as String,
    );

Map<String, dynamic> _$Step3PostToJson(Step3Post instance) => <String, dynamic>{
      'owner_id': instance.ownerId,
      'created_at': instance.createdAt.toIso8601String(),
      'title': instance.title,
      'body': instance.body,
    };
