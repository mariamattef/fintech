import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../cubits/chart_cubit/chart_state.dart';

class CryptoLineChart extends StatelessWidget {
  final ProcessedChartData processedData;

  const CryptoLineChart({super.key, required this.processedData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minY: processedData.minY,
        maxY: processedData.maxY,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(),
          topTitles: AxisTitles(),
          leftTitles: AxisTitles(),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: (processedData.spots.length ~/ 5).toDouble(),
              getTitlesWidget: (value, meta) {
                final dt = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                return Text(
                  "${dt.hour}:${dt.minute.toString().padLeft(2, '0')}",
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                );
              },
            ),
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            isCurved: true,
            spots: processedData.spots,
            barWidth: 3,
            color: Colors.blue,
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.3),
                  Colors.blue.withOpacity(0.0),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            dotData: FlDotData(
              show: true,
              getDotPainter: (_, __, ___, ____) {
                return FlDotCirclePainter(
                  radius: 3,
                  color: Colors.orange,
                  strokeWidth: 2,
                  strokeColor: Colors.white,
                );
              },
            ),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            // tooltipBgColor: Colors.black.withOpacity(0.7),
            getTooltipItems: (items) {
              return items.map((e) {
                final dt = DateTime.fromMillisecondsSinceEpoch(e.x.toInt());
                return LineTooltipItem(
                  "\$${e.y.toStringAsFixed(2)}\n${dt.hour}:${dt.minute}",
                  TextStyle(color: Colors.white),
                );
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
