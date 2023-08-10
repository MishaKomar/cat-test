import 'base_model.dart';

class CatFactModel implements BaseModel {
  final String id; // Unique ID for the Fact
  final int version; // Version number of the Fact
  final String user; // ID of the User who added the Fact
  final String text; // The Fact itself
  final DateTime updatedAt; // Date in which Fact was last modified
  final DateTime
      createdAt; // If the Fact is meant for one time use, this is the date that it is used
  final bool deleted; // Whether the Fact has been soft-deleted
  final String source; // Source from which the fact was found. Typically a URL
  final String
      type; // Type of animal the Fact describes (e.g. ‘cat’, ‘dog’, ‘horse’)
  final bool
      statusVerified; // Whether the fact has been appproved or rejected. null indicates pending status
  final int
      statusSentCount; // The number of times the Fact has been sent by the CatBot
  final String?
      statusFeedback; // Reason for the fact being approved or rejected

  const CatFactModel({
    required this.id,
    required this.version,
    required this.user,
    required this.text,
    required this.updatedAt,
    required this.createdAt,
    required this.deleted,
    required this.source,
    required this.type,
    required this.statusVerified,
    required this.statusSentCount,
    this.statusFeedback,
  });

  factory CatFactModel.mock() => CatFactModel(
        id: '58e008780aac31001185ed05',
        version: 0,
        user: '58e007480aac31001185ecef',
        text:
            'Owning a cat can reduce the risk of stroke and heart attack by a third.',
        updatedAt: DateTime.parse('2020-08-23T20:20:01.611Z'),
        createdAt: DateTime.parse('2018-03-29T20:20:03.844Z'),
        deleted: false,
        source: 'user',
        type: 'cat',
        statusVerified: true,
        statusSentCount: 1,
      );
}
