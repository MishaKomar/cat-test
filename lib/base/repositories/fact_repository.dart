import 'package:cattest/base/models/adaptation/base_adaptation_strategy.dart';
import 'package:cattest/base/models/adaptation/fact_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';
import 'package:cattest/base/network/client/base_network_client.dart';
// import 'package:cattest/base/network/client/mock_network_client.dart';
import 'package:cattest/base/network/client/retrofit_network_client.dart';
import 'package:cattest/base/network/provider/dio_network_provider.dart';

class FactsRepository {
  static final FactsRepository _instance = FactsRepository._(
    // MockNetworkClient(),
    RetrofitNetworkClient(
      DioNetworkProvider.i.dio,
    ),
    const FactAdaptationStrategy(),
  );

  static FactsRepository get instance => _instance;
  static FactsRepository get i => _instance;

  final BaseNetworkClient _networkClient;
  final BaseAdaptationStrategy _adaptationStrategy;

  const FactsRepository._(
    this._networkClient,
    this._adaptationStrategy,
  );

  Future<FactModel> randomFact() async {
    final factResponse = await _networkClient.getRandomFact();
    final model = _adaptationStrategy.to(factResponse) as FactModel;
    return model;
  }

  List<FactModel> factHistory() {
    return List.generate(10, (index) => FactModel.mock());
  }

  List<FactModel> clearHistory() {
    return [];
  }
}
