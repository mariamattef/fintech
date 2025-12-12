import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'fee_box.dart';

class FeeSection extends StatelessWidget {
  const FeeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FeeBox(title: "Exchange fee", feeValue: "0.05%"),
        ),
        Gap(15.w),
        Container(
          width: 120.w,
          padding: EdgeInsets.symmetric(vertical: 22.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: Text(
              "\$26",
              style: AppTextStyles.headingH5.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
