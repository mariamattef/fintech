import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'holding_item.dart';

class HoldingsList extends StatelessWidget {
  const HoldingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "My Holdings",
          style: AppTextStyles.mMedium.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Gap(30.h),
        HoldingItem(
          name: "Bitcoin",
          symbol: "BTC",
          percent: "50%",
          amount: "0.05 BTC",
          value: "\$2,262.53",
          profit: "+\$145.20",
          profitPercent: "+6.85%",
          icon: Icons.currency_bitcoin,
        ),

        Gap(15.h),
        HoldingItem(
          name: "Ethereum",
          symbol: "ETH",
          percent: "30%",
          amount: "1.5 ETH",
          value: "\$3,150.75",
          profit: "+\$56.70",
          profitPercent: "+1.83%",
          icon: Icons.blur_circular,
        ),

        SizedBox(height: 12),
        HoldingItem(
          name: "Litecoin",
          symbol: "LTC",
          percent: "20%",
          amount: "26.3 LTC",
          value: "\$2,503.76",
          profit: "+\$120.80",
          profitPercent: "+5.07%",
          icon: Icons.light_mode,
        ),
      ],
    );
  }
}
