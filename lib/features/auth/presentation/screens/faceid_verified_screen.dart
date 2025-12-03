import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:fintech/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FaceidVerifiedScreen extends StatelessWidget {
  static const String routeName = '/faceidVerifiedScreen';
  const FaceidVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(30..r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Gap(50),
                  Spacer(),
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28.r),
                    ),

                    elevation: 10,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.w,
                        vertical: 30.0.h,
                      ),
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/svg/icons/Component 1.svg',
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
                              color:
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  Spacer(),
                  TextHeader(
                    title: 'You’re verified',
                    subtitle: '',
                    subtile2: '',
                  ),

                  Text(
                    'You have been verified your \ninformation completely. Let’s make transactions!',
                    style: AppTextStyles.lRegular,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  CustomElevationBottom(
                    text: 'Continue To Home',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        Root.routeName,
                        (route) => false,
                      );
                    },
                  ),
                  Gap(20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              'assets/svg/icons/Ellipse 52.svg',
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
