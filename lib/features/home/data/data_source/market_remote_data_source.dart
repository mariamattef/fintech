import 'package:fintech/core/connection/network_info.dart';
import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/core/errors/exceptions.dart';
import 'package:fintech/features/home/data/models/market_over_view_model.dart';

abstract class MarketOverviewDataSource {
  Future<MarketOverviewModel> getMarketOverview();
}

class MarketOverviewDataSourceImpl implements MarketOverviewDataSource {
  final ApiConsumer api;
  final InternetService internetService;

  MarketOverviewDataSourceImpl(
      {required this.api, required this.internetService});
  @override
  Future<MarketOverviewModel> getMarketOverview() async {
    if (await internetService.isConnected) {
      final response = await api.get(EndPoints.global); // Example endpoint
      final jsonData = response['data'];
      return MarketOverviewModel.fromJson(jsonData);
    } else {
      throw OfflineException();
    }
  }
}
