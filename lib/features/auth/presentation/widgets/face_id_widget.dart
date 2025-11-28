import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/auth/presentation/screens/faceid_verified_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FaceIdWidget extends StatelessWidget {
  final void Function() onTap;
  final String stringImg;
  const FaceIdWidget({super.key, required this.onTap, required this.stringImg});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28.r),
        ),

        elevation: 10,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 30.0.h),
          child: Column(
            children: [
              SvgPicture.asset(
                stringImg,
                width: 65.w,
                height: 65.h,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                  BlendMode.srcIn,
                ),
              ),
              Gap(20),
              Text(
                'Face ID',
                style: AppTextStyles.headingH4.copyWith(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
