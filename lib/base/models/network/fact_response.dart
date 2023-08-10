// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'base_network_response.dart';
import 'fact_status.dart';

part 'fact_response.g.dart';

@JsonSerializable()
class FactResponse implements BaseNetworkResponse {
  final FactStatus status;
  @JsonKey(name: '_id')
  final String id;
  final String user;
  final String text;
  @JsonKey(name: '__v')
  final int version;
  @JsonKey(toJson: _dateToJson, fromJson: _dateFromJson)
  final DateTime updatedAt;
  final String type;
  @JsonKey(toJson: _dateToJson, fromJson: _dateFromJson)
  final DateTime createdAt;
  @JsonKey(defaultValue: false)
  final bool deleted;

  FactResponse({
    required this.status,
    required this.id,
    required this.user,
    required this.text,
    required this.version,
    required this.updatedAt,
    required this.type,
    required this.createdAt,
    required this.deleted,
  });

  static String _dateToJson(DateTime value) => value.toIso8601String();
  static DateTime _dateFromJson(String value) => DateTime.parse(value);

  factory FactResponse.fromJson(Map<String, dynamic> json) =>
      _$FactResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FactResponseToJson(this);
}
