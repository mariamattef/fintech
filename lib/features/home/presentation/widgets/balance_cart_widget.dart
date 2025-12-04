import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
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
                "Current Balance",
                style: AppTextStyles.sSemiBold.copyWith(
                  color: Color(0xFFF5F8FE),
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
                      "Weekly Profit ",
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
                        color: Colors.white.withValues(alpha: 0.1),
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
            "assets/svg/icons/EllipseR3.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.2)
                  : Color.fromRGBO(255, 255, 255, 0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            "assets/svg/icons/EllipseR2.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.3)
                  : Color.fromRGBO(255, 255, 255, 0.3),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            "assets/svg/icons/EllipseR1.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.5)
                  : Color.fromRGBO(255, 255, 255, 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: SvgPicture.asset(
            "assets/svg/icons/EllipseL3.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.2)
                  : Color.fromRGBO(255, 255, 255, 0.2),
              BlendMode.srcIn,
            ),
          ),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: SvgPicture.asset(
            "assets/svg/icons/EllipseL2.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.3)
                  : Color.fromRGBO(255, 255, 255, 0.3),
              BlendMode.srcIn,
            ),
          ),
        ),

        Positioned(
          left: -1,
          bottom: 0,
          child: SvgPicture.asset(
            "assets/svg/icons/EllipseL1.svg",
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? Color.fromRGBO(13, 13, 13, 0.5)
                  : Color.fromRGBO(255, 255, 255, 0.5),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
    //
  }
}
