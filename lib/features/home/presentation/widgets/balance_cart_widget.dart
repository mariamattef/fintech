import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BalanceCardWidget extends StatelessWidget {
  const BalanceCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.primaryLightBlue300,
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1A2C4F).withValues(alpha: 0.3),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                "current_balance".tr(),
                style: AppTextStyles.sSemiBold.copyWith(
                  color: const Color(0xFFF5F8FE),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "\$143,421.20",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "weekly_profit".tr(),
                      style: AppTextStyles.xsSemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    Gap(5.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(9.r),
                      ),
                      child: Text(
                        "2,35% ▴",
                        style: AppTextStyles.textst12.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseR3,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.2)
                  : const Color.fromRGBO(255, 255, 255, 0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseR2,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.3)
                  : const Color.fromRGBO(255, 255, 255, 0.3),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseR1,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.5)
                  : const Color.fromRGBO(255, 255, 255, 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseL3,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.2)
                  : const Color.fromRGBO(255, 255, 255, 0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseL2,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.3)
                  : const Color.fromRGBO(255, 255, 255, 0.3),
              BlendMode.srcIn,
            ),
          ),
        ),

        Positioned(
          left: -1,
          bottom: 0,
          child: SvgPicture.asset(
            AppAssets.ellipseL1,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? const Color.fromRGBO(13, 13, 13, 0.5)
                  : const Color.fromRGBO(255, 255, 255, 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
    //
  }
}
