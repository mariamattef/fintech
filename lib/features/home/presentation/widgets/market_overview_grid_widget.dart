import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/features/home/domain/enteties/market_over_view_entity.dart';
import 'package:fintech/features/home/presentation/widgets/stat_cart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class MarketOverviewGridWidget extends StatelessWidget {
  final MarketOverviewEntity overviewEntity;
  const MarketOverviewGridWidget({super.key, required this.overviewEntity});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              StatCartWidget(
                title: "marketCap".tr(),
                value: NumberFormat.compactCurrency(
                  symbol: '\$',
                  decimalDigits: 2,
                ).format(overviewEntity.totalMarketCap['usd']),
                change: overviewEntity.marketCapChangePercentage24hUsd == null
                    ? null
                    : NumberFormat.decimalPercentPattern(
                        decimalDigits: 3,
                      ).format(
                        overviewEntity.marketCapChangePercentage24hUsd! / 100,
                      ), // This data is not available in the entity
              ),
              const SizedBox(height: 15),
              StatCartWidget(
                title: "btcDominance".tr(),
                value: NumberFormat.percentPattern().format(
                  (overviewEntity.marketCapPercentage['btc'] ?? 0) / 100,
                ),
                change: null,
              ),
            ],
          ),
        ),
        Gap(15.h),
        Expanded(
          child: Column(
            children: [
              StatCartWidget(
                title: "24hVolume".tr(),
                value: NumberFormat.compactCurrency(
                  symbol: '\$',
                  decimalDigits: 2,
                ).format(overviewEntity.totalVolume['usd']),
                change: overviewEntity.marketCapChangePercentage24hUsd == null
                    ? null
                    : NumberFormat.decimalPercentPattern(
                        decimalDigits: 3,
                      ).format(
                        overviewEntity.marketCapChangePercentage24hUsd! / 100,
                      ),
              ),
              Gap(15.h),
              StatCartWidget(
                title: "activeCoins".tr(),
                value: NumberFormat.compact().format(
                  overviewEntity.activeCryptocurrencies,
                ),
                change: null,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
