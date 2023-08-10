import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:cattest/base/models/network/base_network_response.dart';

abstract class BaseAdaptationStrategy {
  BaseModel to(BaseNetworkResponse networkResponse);
  BaseNetworkResponse from(BaseModel model);
}
