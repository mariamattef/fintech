import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/market/data/models/crypto_model/crypto_model.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CryptoModel>> getCryptos({required int page});
}

class CryptoRemoteDataSourceImpl implements CryptoRemoteDataSource {
  final ApiConsumer api;
  CryptoRemoteDataSourceImpl(this.api);
  @override
  Future<List<CryptoModel>> getCryptos({required int page}) async {
    final response = await api.get(EndPoints.cryptos(page: page));
    return (response as List)
        .map((json) => CryptoModel.fromJson(json))
        .toList();
  }
}
