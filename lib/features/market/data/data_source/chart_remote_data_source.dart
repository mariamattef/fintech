import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';

import '../models/chart_point_model.dart';

abstract class ChartRemoteDataSource {
  Future<List<ChartPointModel>> fetchChart(String id, String days);
}

class ChartRemoteDataSourceImpl implements ChartRemoteDataSource {
  final ApiConsumer api;

  ChartRemoteDataSourceImpl(this.api);

  @override
  Future<List<ChartPointModel>> fetchChart(String id, String days) async {
    final response = await api.get(
      EndPoints.coinChartData(id: id, days: days),
    );

    return (response['prices'] as List)
        .map((item) => ChartPointModel.fromJson(item))
        .toList();
  }
}
