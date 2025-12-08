import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/home/data/models/trending_model.dart';

abstract class TrendingRemoteDataSource {
  Future<List<TrendingModel>> getTrendingCoins();
}


class TrendingRemoteDataSourceImpl implements TrendingRemoteDataSource {
  final ApiConsumer api;
  TrendingRemoteDataSourceImpl(this.api);
  @override
  Future<List<TrendingModel>> getTrendingCoins() {
    return api.get(EndPoints.trending).then((response) {
      final coins = response['coins'] as List;
      return coins
          .map((coinData) =>
              TrendingModel.fromJson(coinData['item'] as Map<String, dynamic>))
          .toList();
    });
  }
}