import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';

import 'package:cattest/base/models/storage/base_entity.dart';
import 'package:cattest/base/models/storage/fact_entity.dart';

import 'base_storage_adaptation_strategy.dart';

class FactStorageAdaptationStrategy implements BaseStorageAdaptationStrategy {
  const FactStorageAdaptationStrategy();

  @override
  FactModel to(BaseEnity entity) {
    final entityAs = entity as FactEntity;
    return FactModel(
      id: entityAs.id,
      version: entityAs.version,
      user: entityAs.user,
      text: entityAs.text,
      updatedAt: entityAs.updatedAt,
      createdAt: entityAs.createdAt,
      deleted: entityAs.deleted,
      type: entityAs.type,
      statusVerified: entityAs.statusVerified,
      statusSentCount: entityAs.statusSentCount,
    );
  }

  @override
  FactEntity from(BaseModel model) {
    final modelAs = model as FactModel;

    return FactEntity(
      id: modelAs.id,
      version: modelAs.version,
      user: modelAs.user,
      text: modelAs.text,
      updatedAt: modelAs.updatedAt,
      createdAt: modelAs.createdAt,
      deleted: modelAs.deleted,
      type: modelAs.type,
      statusVerified: modelAs.statusVerified,
      statusSentCount: modelAs.statusSentCount,
    );
  }
}
