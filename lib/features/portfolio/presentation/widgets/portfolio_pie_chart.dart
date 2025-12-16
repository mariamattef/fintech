import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/portfolio/domain/entities/crypto_currency.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class PortfolioPieChart extends StatelessWidget {
  final List<CryptoCurrency> cryptoPrices;
  const PortfolioPieChart({super.key, required this.cryptoPrices});

  @override
  Widget build(BuildContext context) {
    final List<Color> pieColors = [
      const Color(0xff8b6af5),
      const Color(0xffff8b8b),
      const Color(0xff60c1ff),
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];

    double totalPortfolioValue = 0.0;
    for (var crypto in cryptoPrices) {
      double amount = 1.0; 
      totalPortfolioValue += (crypto.usdPrice) * amount;
    }

    List<PieChartSectionData> pieChartSections = [];
    List<Widget> legendItems = [];

    for (int i = 0; i < cryptoPrices.length; i++) {
      final crypto = cryptoPrices[i];
      final Color color = pieColors[i % pieColors.length];
      final double currentPrice = crypto.usdPrice;
      final String symbol = crypto.id.toUpperCase();

      double amount = 1.0; 
      double value = currentPrice * amount;
      double percentage = (value / totalPortfolioValue) * 100;

      pieChartSections.add(
        PieChartSectionData(
          color: color,
          value: percentage, 
          title: '${percentage.toStringAsFixed(1)}%',
          radius: 20.r,
          titleStyle: AppTextStyles.sMedium.copyWith(color: Colors.white),
        ),
      );

      legendItems.add(
        Column(
          children: [
            LegendItem(
              color: color,
              text: "\$${value.toStringAsFixed(2)} $symbol",
            ),
            if (i < cryptoPrices.length - 1) Gap(10.h),
          ],
        ),
      );
    }

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
                  sections: pieChartSections,
                ),
              ),

              /// CENTER LABEL
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${totalPortfolioValue.toStringAsFixed(2)}",
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
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: legendItems,
          ),
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
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.text15.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
