// ignore: depend_on_referenced_packages

import 'package:cattest/base/models/storage/fact_entity.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveStorageProvider {
  static const String _dbName = 'facts_db';
  static const String _factsCollectionName = 'facts';

  static late final HiveStorageProvider _instance;
  static HiveStorageProvider get instance => _instance;
  static HiveStorageProvider get i => _instance;

  static Future<void> init() async {
    final dir = await getTemporaryDirectory();
    Hive
      ..init(dir.path)
      ..registerAdapter(FactEntityAdapter());

    final collection = await BoxCollection.open(
      _dbName, // Name of your database
      {_factsCollectionName}, // Names of your boxes
      path: dir.path, // Path where to store your boxes
    );

    // Open your boxes. Optional: Give it a type.
    final box = await collection.openBox<FactEntity>(_factsCollectionName);
    _instance = HiveStorageProvider._(box);
  }

  final CollectionBox<FactEntity> _factBox;

  const HiveStorageProvider._(this._factBox);

  CollectionBox<FactEntity> get factBox => i._factBox;
}
