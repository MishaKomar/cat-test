import 'package:cattest/base/models/network/fact_response.dart';

import 'base_network_client.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'retrofit_network_client.g.dart';

// TODO: move to env variables
@RestApi(baseUrl: 'https://cat-fact.herokuapp.com')
abstract class RetrofitNetworkClient implements BaseNetworkClient {
  factory RetrofitNetworkClient(Dio dio, {String baseUrl}) =
      _RetrofitNetworkClient;

  @override
  @GET('/facts/random')
  Future<FactResponse> getRandomFact({
    @Query('animal_type') String animalType = 'cat',
    @Query('amount') int amount = 1,
  });
}
