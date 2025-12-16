import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_state.freezed.dart';

@freezed
class ChartState with _$ChartState {
  const factory ChartState.initial() = _Initial;

  const factory ChartState.loading() = _Loading;

  const factory ChartState.success(ProcessedChartData data) = _Success;

  const factory ChartState.failure(String message) = _Failure;
}

class ProcessedChartData {
  final List<FlSpot> spots;
  final double minY;
  final double maxY;

  ProcessedChartData({
    required this.spots,
    required this.minY,
    required this.maxY,
  });
}
