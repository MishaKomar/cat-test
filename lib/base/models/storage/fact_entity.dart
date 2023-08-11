import 'base_entity.dart';
import 'package:hive/hive.dart';

part 'fact_entity.g.dart';

@HiveType(typeId: 0)
class FactEntity extends HiveObject implements BaseEntity {
  @HiveField(0)
  @override
  final String id;
  @HiveField(1)
  final int version;
  @HiveField(2)
  final String user;
  @HiveField(3)
  final String text;
  @HiveField(4)
  final DateTime updatedAt;
  @HiveField(5)
  final DateTime createdAt;
  @HiveField(6)
  final bool deleted;
  @HiveField(7)
  final String type;
  @HiveField(8)
  final bool statusVerified;
  @HiveField(9)
  final int statusSentCount;

  FactEntity({
    required this.id,
    required this.version,
    required this.user,
    required this.text,
    required this.updatedAt,
    required this.createdAt,
    required this.deleted,
    required this.type,
    required this.statusVerified,
    required this.statusSentCount,
  });

  @override
  String toString() {
    return 'FactEntity{ id: $id, version: $version, user: $user, text: $text, updatedAt: $updatedAt, createdAt: $createdAt, deleted: $deleted, type: $type, statusVerified: $statusVerified, statusSentCount: $statusSentCount}';
  }
}
