import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/widgets/icon_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HoldingItem extends StatelessWidget {
  final String name;
  final String symbol;
  final String percent;
  final String amount;
  final String value;
  final String profit;
  final String profitPercent;
  final IconData icon;

  const HoldingItem({
    super.key,
    required this.name,
    required this.symbol,
    required this.percent,
    required this.amount,
    required this.value,
    required this.profit,
    required this.profitPercent,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconContainerWidget(image: "assets/images/Face ID.png"),
              Gap(15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: AppTextStyles.text16700.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    symbol,
                    style: AppTextStyles.textst12.copyWith(
                      color: Color.fromRGBO(120, 122, 141, 1),
                    ),
                  ),
                  Gap(15.h),
                  Text(
                    amount,
                    style: AppTextStyles.sMedium.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Gap(5.h),
                  Text(
                    value,
                    style: AppTextStyles.xsMedium.copyWith(
                      color: Color(0xffF67E42),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                percent,
                style: AppTextStyles.headingH5.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                profit,
                style: AppTextStyles.sMedium.copyWith(color: Color(0xff7DDDA4)),
              ),
              Text(
                profitPercent,
                style: AppTextStyles.xsMedium.copyWith(
                  color: Color(0xff7DDDA4),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
