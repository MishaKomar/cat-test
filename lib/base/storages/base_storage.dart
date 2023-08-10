import 'package:cattest/base/models/storage/base_entity.dart';

abstract class BaseStorage {
  Future<bool> create(BaseEnity entity);
  Future<BaseEnity> read(String id);
  Future<BaseEnity> update(BaseEnity entity);
  Future<bool> delete(BaseEnity entity);
}
