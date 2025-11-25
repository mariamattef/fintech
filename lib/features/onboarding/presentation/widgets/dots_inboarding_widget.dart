import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsInBoardingWidget extends StatelessWidget {
  const DotsInBoardingWidget({
    super.key,
    required this.currentIndex,
    required this.onboardingData,
    required PageController controller,
  }) : _controller = controller;

  final int currentIndex;
  final List<Map<String, String>> onboardingData;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.h, left: 20.w, bottom: 60.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Next Button
          GestureDetector(
            onTap: () {
              if (currentIndex < onboardingData.length - 1) {
                _controller.nextPage(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              }
            },
            child: Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 15.sp,
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.grey0
                    : AppColors.grey900,
              ),
            ),
          ),
          Row(
            children: List.generate(
              onboardingData.length,
              (index) => AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.only(right: 5.w),
                width: currentIndex == index ? 23.w : 10.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Color(0xff494D58),

                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
