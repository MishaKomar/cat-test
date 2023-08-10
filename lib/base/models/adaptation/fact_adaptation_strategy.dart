import 'package:cattest/base/models/adaptation/base_adaptation_strategy.dart';
import 'package:cattest/base/models/bussines/base_model.dart';
import 'package:cattest/base/models/bussines/fact_model.dart';
import 'package:cattest/base/models/network/base_network_response.dart';
import 'package:cattest/base/models/network/fact_response.dart';
import 'package:cattest/base/models/network/fact_status.dart';

class FactAdaptationStrategy implements BaseAdaptationStrategy {
  const FactAdaptationStrategy();
  @override
  FactModel to(BaseNetworkResponse networkResponse) {
    final networkResponseAs = networkResponse as FactResponse;
    return FactModel(
      id: networkResponseAs.id,
      version: networkResponseAs.version,
      user: networkResponseAs.user,
      text: networkResponseAs.text,
      updatedAt: networkResponseAs.updatedAt,
      createdAt: networkResponseAs.createdAt,
      deleted: networkResponseAs.deleted,
      type: networkResponseAs.type,
      statusVerified: networkResponseAs.status.verified,
      statusSentCount: networkResponseAs.status.sentCount,
    );
  }

  @override
  FactResponse from(BaseModel model) {
    final modelAs = model as FactModel;

    return FactResponse(
      id: modelAs.id,
      version: modelAs.version,
      user: modelAs.user,
      text: modelAs.text,
      updatedAt: modelAs.updatedAt,
      createdAt: modelAs.createdAt,
      deleted: modelAs.deleted,
      type: modelAs.type,
      status: FactStatus(
        verified: modelAs.statusVerified,
        sentCount: modelAs.statusSentCount,
      ),
    );
  }
}
