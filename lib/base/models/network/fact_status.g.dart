// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FactStatus _$FactStatusFromJson(Map<String, dynamic> json) => FactStatus(
      verified: json['verified'] as bool? ?? false,
      sentCount: json['sentCount'] as int,
    );

Map<String, dynamic> _$FactStatusToJson(FactStatus instance) =>
    <String, dynamic>{
      'verified': instance.verified,
      'sentCount': instance.sentCount,
    };
