import 'package:fintech/features/market/domain/entities/chart_point_entity.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:fintech/features/market/domain/use_cases/get_chart_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chart_state.dart';

class ChartCubit extends Cubit<ChartState> {
  final GetChartUseCase getChart;

  ChartCubit(this.getChart) : super(const ChartState.initial());

  Future<void> loadChart(String id, String days) async {
    emit(const ChartState.loading());

    final result = await getChart(id, days);

    result.fold(
      (failure) => emit(ChartState.failure(failure.errorMessage)),
      (data) async {
        final processedData = await compute(_processChartData, data);
        emit(ChartState.success(processedData));
      },
    );
  }
}

ProcessedChartData _processChartData(List<ChartPointEntity> data) {
  final spots = data
      .map((e) => FlSpot(e.time.millisecondsSinceEpoch.toDouble(), e.price))
      .toList();

  final double minY =
      data.map((e) => e.price).reduce((a, b) => a < b ? a : b) * 0.95;
  final double maxY =
      data.map((e) => e.price).reduce((a, b) => a > b ? a : b) * 1.05;

  return ProcessedChartData(spots: spots, minY: minY, maxY: maxY);
}
