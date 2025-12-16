import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/market/data/models/crypto_model/crypto_model.dart';

abstract class CryptoRemoteDataSource {
  Future<List<CryptoModel>> getCryptos({required int page});
  Future<List<CryptoModel>> searchCryptos({required String query});
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

  @override
  Future<List<CryptoModel>> searchCryptos({required String query}) async {
    final searchResponse = await api.get(EndPoints.searchCoins(query: query));
    final List<String> coinIds = [];
    if (searchResponse != null && searchResponse['coins'] != null) {
      for (var coinJson in searchResponse['coins']) {
        coinIds.add(coinJson['id']);
      }
    }

    if (coinIds.isEmpty) {
      return [];
    }

    // Now fetch detailed market data for the found coins
    final String idsParam = coinIds.join(',');
    final marketResponse = await api.get(
      "coins/markets?vs_currency=usd&order=market_cap_desc&per_page=50&page=1&ids=$idsParam",
    );

    return (marketResponse as List)
        .map((json) => CryptoModel.fromJson(json))
        .toList();
  }

}
