import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'transaction_item.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text(
          "recentTransactions".tr(),
          style:AppTextStyles.mMedium.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
       Gap(15.h),
        TransactionItem(
          title: "buyBitcoin".tr(),
          amount: "0.01 BTC",
          time: "twoHoursAgo".tr(),
          value: "-\$452.50",
          icon: Icons.arrow_circle_up_rounded,
          iconColor: Colors.green,
        ),
        Gap(15.h),
        TransactionItem(
          title: "sellEthereum".tr(),
          amount: "0.5 ETH",
          time: "oneDayAgo".tr(),
          value: "+\$1,050.25",
          icon: Icons.arrow_circle_down_rounded,
          iconColor: Colors.red,
        ),
      ],
    );
  }
}
