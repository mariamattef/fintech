import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SettingsItem extends StatelessWidget {
  final String assetName;
  final String title;
  final VoidCallback onTap;

  const SettingsItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.primaryLightBlue300,
            child: SvgPicture.asset(
              assetName,
              height: 20.h,
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
          title: Text(
            title,
            style: AppTextStyles.mSemiBold.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          trailing: Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.primary,
          ),
          onTap: onTap,
        ),
        Gap(10.h),
        Divider(
          indent: 20.w,
          endIndent: 20.w,
          height: 0,
          color: Color.fromRGBO(94, 94, 94, 1),
        ),
      ],
    );
  }
}
