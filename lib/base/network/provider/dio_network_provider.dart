// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

class DioNetworkProvider {
  static final DioNetworkProvider _instance = DioNetworkProvider._(
    Dio(),
  );

  static DioNetworkProvider get instance => _instance;
  static DioNetworkProvider get i => _instance;

  final Dio _dio;

  Dio get dio => _dio;

  const DioNetworkProvider._(this._dio);
}
