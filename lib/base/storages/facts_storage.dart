import 'package:cattest/base/models/adaptation/bussines_storage/fact_network_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';

import 'base/hive_storage.dart';
import 'provider/hive_storage_provider.dart';

class FactsStorage extends HiveStorage {
  FactsStorage()
      : super(
          HiveStorageProvider.i.factBox,
          const FactStorageAdaptationStrategy(),
        );

  @override
  Future<FactModel?> read(String id) async {
    final model = await super.read(id);
    return model as FactModel?;
  }

  @override
  Future<List<FactModel>> readAll() async {
    final list = await super.readAll();
    return list.cast<FactModel>();
  }
}
