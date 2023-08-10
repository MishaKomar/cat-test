// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactResponse _$FactResponseFromJson(Map<String, dynamic> json) => FactResponse(
      status: FactStatus.fromJson(json['status'] as Map<String, dynamic>),
      id: json['_id'] as String,
      user: json['user'] as String,
      text: json['text'] as String,
      version: json['__v'] as int,
      updatedAt: FactResponse._dateFromJson(json['updatedAt'] as String),
      type: json['type'] as String,
      createdAt: FactResponse._dateFromJson(json['createdAt'] as String),
      deleted: json['deleted'] as bool? ?? false,
    );

Map<String, dynamic> _$FactResponseToJson(FactResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      '_id': instance.id,
      'user': instance.user,
      'text': instance.text,
      '__v': instance.version,
      'updatedAt': FactResponse._dateToJson(instance.updatedAt),
      'type': instance.type,
      'createdAt': FactResponse._dateToJson(instance.createdAt),
      'deleted': instance.deleted,
    };
