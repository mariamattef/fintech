import 'package:fintech/core/config/app_text_style.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PortfolioPieChart extends StatelessWidget {
  const PortfolioPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        /// PIE CHART
        SizedBox(
          height: 180.h,
          width: 180.w,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PieChart(
                PieChartData(
                  sectionsSpace: 0,
                  centerSpaceRadius: 55.r,
                  startDegreeOffset: -90,
                  sections: [
                    PieChartSectionData(
                      color: const Color(0xff8b6af5),
                      radius: 20.r,
                    ),
                    PieChartSectionData(
                      color: const Color(0xffff8b8b),
                      radius: 20.r,
                    ),
                    PieChartSectionData(
                      color: const Color(0xff60c1ff),
                      radius: 20.r,
                    ),
                  ],
                ),
              ),

              /// CENTER LABEL
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$143,421.20",
                    style: AppTextStyles.text15.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LegendItem(color: Color(0xff60c1ff), text: "\$54,382.64 BTC"),
            Gap(10.h),
            LegendItem(color: Color(0xff8b6af5), text: "\$4,145.61 ETH"),
            Gap(10.h),
            LegendItem(color: Color(0xffff8b8b), text: "\$64,20.5 LTC"),
          ],
        ),
      ],
    );
  }
}

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 12.h,
          width: 12.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: AppTextStyles.text15.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
