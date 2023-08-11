import 'package:cattest/base/env/env.dart';
import 'package:cattest/base/models/adaptation/bussines_network/base_network_adaptation_strategy.dart';
import 'package:cattest/base/models/adaptation/bussines_network/fact_network_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';
import 'package:cattest/base/network/client/base_network_client.dart';
import 'package:cattest/base/network/client/mock_network_client.dart';
import 'package:cattest/base/network/client/retrofit_network_client.dart';
import 'package:cattest/base/network/provider/dio_network_provider.dart';
import 'package:cattest/base/storages/facts_storage.dart';

class FactsRepository {
  static final FactsRepository _instance = FactsRepository._(
    kIsDemo
        ? MockNetworkClient()
        : RetrofitNetworkClient(DioNetworkProvider.i.dio),
    FactsStorage(),
    const FactNetworkAdaptationStrategy(),
  );

  static FactsRepository get instance => _instance;
  static FactsRepository get i => _instance;

  final BaseNetworkClient _networkClient;
  final FactsStorage _storage;
  final BaseNetworkAdaptationStrategy _networkAdaptationStrategy;

  FactsRepository._(
    this._networkClient,
    this._storage,
    this._networkAdaptationStrategy,
  );

  Future<FactModel> randomFact() async {
    final factResponse = await _networkClient.getRandomFact();
    final model = _networkAdaptationStrategy.to(factResponse) as FactModel;
    await _storage.create(model);
    return model;
  }

  Future<List<FactModel>> factsHistory() async {
    final list = await _storage.readAll();
    return list;
  }

  Future<void> clearHistory() {
    return _storage.deleteAll();
  }
}
