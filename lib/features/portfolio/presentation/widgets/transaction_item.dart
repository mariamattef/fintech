import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String amount;
  final String time;
  final String value;
  final IconData icon;
  final Color iconColor;

  const TransactionItem({
    super.key,
    required this.title,
    required this.amount,
    required this.time,
    required this.value,
    required this.icon,
    required this.iconColor,
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
            children: [
              CircleAvatar(
                backgroundColor: Theme.brightnessOf(context) == Brightness.dark
                    ? Color(0xff1B1B1B)
                    : Color(0xffEDF0F4),
                child: Icon(icon, size: 25.sp, color: iconColor),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.mRegular.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    time,
                    style: AppTextStyles.sMedium.copyWith(
                      color: Color(0xff949494),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// RIGHT
          Column(
            children: [
              Text(
                amount,
                style: AppTextStyles.sMedium.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                value,
                style: AppTextStyles.xsMedium.copyWith(
                  color: Color(0xff69D895),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
