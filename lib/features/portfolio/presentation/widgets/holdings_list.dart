import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/portfolio/domain/entities/crypto_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'holding_item.dart';

class HoldingsList extends StatelessWidget {
  final List<CryptoCurrency> cryptoPrices;
  const HoldingsList({super.key, required this.cryptoPrices});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "myHoldings".tr(),
          style: AppTextStyles.mMedium.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Gap(30.h),
        ...cryptoPrices.map((crypto) {
          final String name = crypto.id;
          final String symbol = crypto.id.toUpperCase();
          final double currentPrice = crypto.usdPrice;
          final double priceChange24h = crypto.usd24hrChange;
          final String amount = "N/A"; 
          final String percent = "N/A"; 
          final String profit = priceChange24h >= 0
              ? "+\$${(priceChange24h).toStringAsFixed(2)}"
              : "-\$${(priceChange24h).abs().toStringAsFixed(2)}";
          final String profitPercent =
              "${priceChange24h >= 0 ? '+' : ''}${(priceChange24h).toStringAsFixed(2)}%";

          return Column(
            children: [
              HoldingItem(
                name: name,
                symbol: symbol,
                percent: percent,
                amount: amount,
                value: "\$${currentPrice.toStringAsFixed(2)}",
                profit: profit,
                profitPercent: profitPercent,
                imageUrl: crypto.image ?? '',
              ),
              Gap(15.h),
            ],
          );
        }),
      ],
    );
  }
}
