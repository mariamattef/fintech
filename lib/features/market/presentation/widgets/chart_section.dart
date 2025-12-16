import 'package:fintech/features/market/presentation/cubits/chart_cubit/chart_cubit.dart';
import 'package:fintech/features/market/presentation/cubits/chart_cubit/chart_state.dart';
import 'package:fintech/features/market/presentation/widgets/chart_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'crypto_line_chart.dart';

class ChartSection extends StatefulWidget {
  final String coinId;

  const ChartSection({super.key, required this.coinId});

  @override
  State<ChartSection> createState() => _ChartSectionState();
}

class _ChartSectionState extends State<ChartSection> {
  String selected = "1d";

  @override
  void initState() {
    super.initState();
    // context.read<ChartCubit>().loadChart(widget.coinId, "1");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: BlocBuilder<ChartCubit, ChartState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(child: Text("Loading...")),
                  loading: () => const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  failure: (msg) => Center(
                    child: Text(msg, style: const TextStyle(color: Colors.red)),
                  ),
                  success: (list) => CryptoLineChart(processedData: list),
                );
              },
            ),
          ),

          const SizedBox(height: 12),
          ChartPeriods(
            selected: selected,
            onSelect: (value) {
              setState(() => selected = value);

              final days = switch (value) {
                "1h" => "1",
                "1d" => "1",
                "1w" => "7",
                "1m" => "30",
                "1y" => "30",
                _ => "1",
              };

              context.read<ChartCubit>().loadChart(widget.coinId, days);
            },
          ),
        ],
      ),
    );
  }
}
