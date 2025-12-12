import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeeBox extends StatelessWidget {
  final String title;
  final String feeValue;

  const FeeBox({
    super.key,
    required this.title,
    required this.feeValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.all(15.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Container(
            padding:  EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Color(0xffF67E42),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child:  Icon(Icons.attach_money_outlined,
                 size: 20.sp),
          ),
          Gap(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style:AppTextStyles.textst12.copyWith(color: Color(0xff949494))),
                Gap(5.h),
              Text(
                feeValue,
                style: AppTextStyles.mSemiBold.copyWith(color: Theme.of(context).colorScheme.primary)
              ),
            ],
          ),
        ],
      ),
    );
  }
}
