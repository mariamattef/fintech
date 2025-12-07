import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:fintech/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class FingureVerifiedScreen extends StatelessWidget {
    static const String routeName = RoutesContants.fingureVerified;
  const FingureVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  const CircleAvatar(
                    radius: 65,
                    child: Icon(Icons.check_rounded, size: 110),
                  ),
                  const Spacer(),
                  const TextHeader(
                    title: 'You’re verified',
                    subtitle: '',
                    subtile2: '',
                  ),
                  Text(
                    'You have been verified your \ninformation completely. Let’s make transactions!',
                    style: AppTextStyles.lRegular,
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),
                  CustomElevationBottom(
                    text: 'Continue To Home',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesContants.root,
                        (route) => false,
                      );
                    },
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppAssets.ellipse52,
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