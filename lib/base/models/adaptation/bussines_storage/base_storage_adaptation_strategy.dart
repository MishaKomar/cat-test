import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:cattest/base/models/storage/base_entity.dart';

abstract class BaseStorageAdaptationStrategy {
  BaseModel to(BaseEntity entity);
  BaseEntity from(BaseModel model);
}
