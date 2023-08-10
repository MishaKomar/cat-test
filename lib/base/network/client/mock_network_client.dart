import 'dart:async';

import 'package:cattest/base/models/network/fact_response.dart';
import 'package:cattest/base/utils/json_asset_loader.dart';

import 'base_network_client.dart';

class MockNetworkClient implements BaseNetworkClient {
  static const _pathToMockJson = 'assets/json/fact_response.json';
  const MockNetworkClient();

  @override
  Future<FactResponse> getRandomFact() async {
    final json = await JsonAssetLoader.load(_pathToMockJson);
    final fact = FactResponse.fromJson(json);
    return fact;
  }
}
