import 'dart:async';
import 'dart:math';

import 'package:cattest/base/models/network/fact_response.dart';
import 'package:cattest/base/utils/json_asset_loader.dart';

import 'base_network_client.dart';

class MockNetworkClient implements BaseNetworkClient {
  static const _pathToMockJson = 'assets/json/fact_response.json';

  List<FactResponse> _list = [];
  MockNetworkClient();

  @override
  Future<FactResponse> getRandomFact() async {
    if (_list.isEmpty) {
      final json = await JsonAssetLoader.load(_pathToMockJson);
      _list = List.from(json).map((e) => FactResponse.fromJson(e)).toList();
    }
    final randomIndex = Random().nextInt(_list.length - 1);
    return _list[randomIndex];
  }
}
