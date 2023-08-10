import 'package:cattest/base/models/network/fact_response.dart';

abstract class BaseNetworkClient {
  const BaseNetworkClient();

  Future<FactResponse> getRandomFact();
}
