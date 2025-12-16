import 'package:hive/hive.dart';
import '../models/chart_point_model.dart';

abstract class ChartLocalDataSource {
  Future<List<ChartPointModel>?> getChart(String id, String days);
  Future<void> saveChart(String id, String days, List<ChartPointModel> chartPoints);
}

class ChartLocalDataSourceImpl implements ChartLocalDataSource {
  final Box<Map<String, dynamic>> box;

  ChartLocalDataSourceImpl(this.box);

  @override
  Future<List<ChartPointModel>?> getChart(String id, String days) async {
    final key = '$id-$days';
    final data = box.get(key);
    if (data != null) {
      final dataMap = data as Map<String, dynamic>;
      final timestamp = dataMap['timestamp'] as int;
      final difference = DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(timestamp));
      if (difference.inHours < 1) {
        return (dataMap['data'] as List).map((e) => ChartPointModel.fromMap(e as Map<String, dynamic>)).toList();
      }
    }
    return null;
  }

  @override
  Future<void> saveChart(String id, String days, List<ChartPointModel> chartPoints) async {
    final key = '$id-$days';
    final data = {
      'timestamp': DateTime.now().millisecondsSinceEpoch,
      'data': chartPoints.map((e) => e.toMap()).toList(),
    };
    await box.put(key, data);
  }
}
