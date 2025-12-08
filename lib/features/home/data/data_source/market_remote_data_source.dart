import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/home/data/models/market_over_view_model.dart';

abstract class MarketOverviewDataSource {
  Future<MarketOverviewModel> getMarketOverview();
}

class MarketOverviewDataSourceImpl implements MarketOverviewDataSource {
  final ApiConsumer api;

  MarketOverviewDataSourceImpl(this.api);
  @override
  Future<MarketOverviewModel> getMarketOverview() async {
    final response = await api.get(EndPoints.global); // Example endpoint
    final jsonData = response['data'];
    return MarketOverviewModel.fromJson(jsonData);
  }
}
