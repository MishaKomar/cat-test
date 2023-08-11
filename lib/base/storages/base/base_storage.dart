import 'package:cattest/base/models/bussines/base_model.dart';

abstract class BaseStorage {
  Future<void> create(BaseModel model);
  Future<BaseModel?> read(String id);
  Future<List<BaseModel>> readAll();
  Future<void> update(BaseModel model);
  Future<void> delete(BaseModel model);
  Future<void> deleteAll();
}
