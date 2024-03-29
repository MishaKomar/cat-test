import 'package:cattest/base/env/env.dart';

import 'base_model.dart';
import 'package:intl/intl.dart';

class FactModel implements BaseModel {
  /// Unique ID for the Fact
  final String id;

  /// Version number of the Fact
  final int version;

  /// ID of the User who added the Fact
  final String user;

  /// The Fact itself
  final String text;

  /// Date in which Fact was last modified
  final DateTime updatedAt;

  /// If the Fact is meant for one time use, this is the date that it is used
  final DateTime createdAt;

  /// Whether the Fact has been soft-deleted
  final bool deleted;

  /// Type of animal the Fact describes (e.g. ‘cat’, ‘dog’, ‘horse’)
  final String type;

  /// Whether the fact has been appproved or rejected. null indicates pending status
  final bool statusVerified;

  /// The number of times the Fact has been sent by the CatBot
  final int statusSentCount;

  String get imageUrl => '$kImageUrl?imageId=$id';
  String get updatedAtShort => DateFormat().format(updatedAt);

  const FactModel({
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
}
