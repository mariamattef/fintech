import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class PaymentTile extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PaymentTile({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppTextStyles.mSemiBold.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          SvgPicture.asset(
            AppAssets.strok,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
