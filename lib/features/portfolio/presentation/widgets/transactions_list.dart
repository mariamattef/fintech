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
          "Recent Transactions",
          style:AppTextStyles.mMedium.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
       Gap(15.h),
        TransactionItem(
          title: "Buy Bitcoin",
          amount: "0.01 BTC",
          time: "2 hours ago",
          value: "-\$452.50",
          icon: Icons.arrow_circle_up_rounded,
          iconColor: Colors.green,
        ),
        Gap(15.h),
        TransactionItem(
          title: "Sell Ethereum",
          amount: "0.5 ETH",
          time: "1 day ago",
          value: "+\$1,050.25",
          icon: Icons.arrow_circle_down_rounded,
          iconColor: Colors.red,
        ),
      ],
    );
  }
}
