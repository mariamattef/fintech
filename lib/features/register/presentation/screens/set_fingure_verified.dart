import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SetFingureVerified extends StatelessWidget {
  static const String routeName = RoutesContants.setFingurePrintVerified;
  const SetFingureVerified({super.key});

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
                  Spacer(),
                  CircleAvatar(
                    radius: 65,
                    child: Icon(Icons.check_rounded, size: 110),
                  ),
                  Spacer(),
                  TextHeader(
                    title: ' Your scanning is complete',
                    subtitle: '',
                    subtile2: '',
                  ),

                  Text(
                    'you will be able to sign in by using fingerprint',
                    style: AppTextStyles.lRegular,
                    textAlign: TextAlign.center,
                  ),
                  Spacer(),
                  CustomElevationBottom(
                    text: 'Continue',
                    onPressed: () {
                      // if (didAuthenticate) {
                      //   Navigator.pushNamed(context, SetFaceIdScreen.routeName);
                      // }

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesContants.setFaceidOrSkip,
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
