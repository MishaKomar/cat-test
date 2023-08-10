import 'package:cattest/base/env/env.dart';
import 'package:cattest/base/models/adaptation/bussines_network/base_network_adaptation_strategy.dart';
import 'package:cattest/base/models/adaptation/bussines_network/fact_network_adaptation_strategy.dart';
import 'package:cattest/base/models/adaptation/bussines_storage/base_storage_adaptation_strategy.dart';
import 'package:cattest/base/models/adaptation/bussines_storage/fact_network_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';
import 'package:cattest/base/models/storage/fact_entity.dart';
import 'package:cattest/base/network/client/base_network_client.dart';
import 'package:cattest/base/network/client/mock_network_client.dart';
import 'package:cattest/base/network/client/retrofit_network_client.dart';
import 'package:cattest/base/network/provider/dio_network_provider.dart';
import 'package:cattest/base/storages/hive_storage.dart';
import 'package:cattest/base/storages/provider/hive_storage_provider.dart';

class FactsRepository {
  static final FactsRepository _instance = FactsRepository._(
    kIsDemo
        ? MockNetworkClient()
        : RetrofitNetworkClient(DioNetworkProvider.i.dio),
    HiveStorage(
      HiveStorageProvider.i.factBox,
    ),
    const FactNetworkAdaptationStrategy(),
    const FactStorageAdaptationStrategy(),
  );

  static FactsRepository get instance => _instance;
  static FactsRepository get i => _instance;

  final BaseNetworkClient _networkClient;
  final HiveStorage _storage;
  final BaseNetworkAdaptationStrategy _networkAdaptationStrategy;
  final BaseStorageAdaptationStrategy _storageAdaptationStrategy;

  FactsRepository._(
    this._networkClient,
    this._storage,
    this._networkAdaptationStrategy,
    this._storageAdaptationStrategy,
  );

  Future<FactModel> randomFact() async {
    final factResponse = await _networkClient.getRandomFact();
    final model = _networkAdaptationStrategy.to(factResponse) as FactModel;

    final entity = _storageAdaptationStrategy.from(model);
    await _storage.create(entity as FactEntity);
    return model;
  }

  Future<List<FactModel>> factsHistory() async {
    final entities = await _storage.readAll();
    final list = entities
        .map((e) => _storageAdaptationStrategy.to(e))
        .cast<FactModel>()
        .toList();
    return list;
  }

  Future<void> clearHistory() {
    return _storage.deleteAll();
  }
}
