import 'package:cattest/base/models/adaptation/bussines_storage/base_storage_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:hive/hive.dart';
import 'package:cattest/base/models/storage/base_entity.dart';

import 'base_storage.dart';

abstract class HiveStorage implements BaseStorage {
  final CollectionBox<BaseEntity> _box;
  final BaseStorageAdaptationStrategy _storageAdaptationStrategy;

  const HiveStorage(
    this._box,
    this._storageAdaptationStrategy,
  );

  @override
  Future<void> create(BaseModel model) {
    final entity = _storageAdaptationStrategy.from(model);
    return _box.put(entity.id, entity);
  }

  @override
  Future<BaseModel?> read(String id) async {
    final entity = await _box.get(id);
    final model = entity != null ? _storageAdaptationStrategy.to(entity) : null;
    return model;
  }

  @override
  Future<List<BaseModel>> readAll() async {
    final entities = await _box.getAllValues();
    final models =
        entities.values.map((e) => _storageAdaptationStrategy.to(e)).toList();
    return models;
  }

  @override
  Future<void> update(BaseModel model) {
    return create(model);
  }

  @override
  Future<void> delete(BaseModel model) {
    final entity = _storageAdaptationStrategy.from(model);
    return _box.delete(entity.id);
  }

  @override
  Future<void> deleteAll() {
    return _box.clear();
  }
}
