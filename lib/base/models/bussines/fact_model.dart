import 'base_model.dart';

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

  factory FactModel.mock() => FactModel(
        id: '58e008780aac31001185ed05',
        version: 0,
        user: '58e007480aac31001185ecef',
        text:
            'Owning a cat can reduce the risk of stroke and heart attack by a third.',
        updatedAt: DateTime.parse('2020-08-23T20:20:01.611Z'),
        createdAt: DateTime.parse('2018-03-29T20:20:03.844Z'),
        deleted: false,
        type: 'cat',
        statusVerified: true,
        statusSentCount: 1,
      );
}
