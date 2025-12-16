import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StetRowWidget extends StatelessWidget {
  final String label;
  final String value;
  final bool isLast;
  const StetRowWidget({
    super.key,
    required this.label,
    required this.value,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(color: Colors.grey.withValues(alpha: 0.1)),
              ),
      ),
      child: Row(
        children: [
          Text(label, style: AppTextStyles.xsMedium),
          const Gap(6),
          Icon(
            Icons.info_rounded,
            color: Theme.of(context).brightness == Brightness.dark
                ? Color.fromRGBO(96, 121, 250, 1)
                : Color.fromRGBO(71, 102, 249, 1),
            size: 12,
          ),
          const Spacer(),
          Text(
            value,
            style: AppTextStyles.sMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
