import 'package:cattest/base/models/storage/fact_entity.dart';
import 'package:hive/hive.dart';

// import 'base_storage.dart';

// implements BaseStorage
class HiveStorage {
  final CollectionBox<FactEntity> _factBox;

  const HiveStorage(this._factBox);

  // @override
  Future<void> create(FactEntity entity) {
    return _factBox.put(entity.id, entity);
  }

  // @override
  Future<FactEntity?> read(String id) {
    return _factBox.get(id);
  }

  Future<List<FactEntity>> readAll() async {
    final list = await _factBox.getAllValues();
    return list.values.toList();
  }

  // @override
  Future<void> update(FactEntity entity) {
    return create(entity);
  }

  // @override
  Future<void> delete(FactEntity entity) {
    return _factBox.delete(entity.id);
  }

  // @override
  Future<void> deleteAll() {
    return _factBox.clear();
  }
}
