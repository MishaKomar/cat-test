// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part 'fact_status.g.dart';

@JsonSerializable()
class FactStatus {
  @JsonKey(defaultValue: false)
  final bool verified;
  final int sentCount;

  FactStatus({
    required this.verified,
    required this.sentCount,
  });

  factory FactStatus.fromJson(Map<String, dynamic> json) =>
      _$FactStatusFromJson(json);

  Map<String, dynamic> toJson() => _$FactStatusToJson(this);
}
