import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:cattest/base/models/storage/base_entity.dart';

abstract class BaseStorageAdaptationStrategy {
  BaseModel to(BaseEnity entity);
  BaseEnity from(BaseModel model);
}
