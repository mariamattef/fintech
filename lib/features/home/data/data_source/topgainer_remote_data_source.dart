import 'package:fintech/core/databases/api/api_consumer.dart';
import 'package:fintech/core/databases/api/end_points.dart';
import 'package:fintech/features/home/data/models/topgainer_model.dart';

abstract class TopgainerRemoteDataSource {
  Future<List<TopgainerModel>> fetchTopGainers();
}

class TopgainerRemoteDataSourceImpl implements TopgainerRemoteDataSource {
  final ApiConsumer api;
  TopgainerRemoteDataSourceImpl(this.api);
  @override
  Future<List<TopgainerModel>> fetchTopGainers() {
    return api.get(EndPoints.topGainers).then((response) {
      final List<dynamic> gainers = response as List<dynamic>;
      return gainers.map((item) {
        return TopgainerModel.fromJson(item as Map<String, dynamic>);
      }).toList();
    });
  }
}
