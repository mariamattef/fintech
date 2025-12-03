import 'package:fintech/core/config/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/splash';
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment(
          0.2.w,
          0.0,
        ), // slightly to the right, vertically centered
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.loose,
          children: [
            SvgPicture.asset(
              AppAssets.ellipse51_1,
              fit: BoxFit.fitWidth,
              width: double.infinity,

              colorFilter: ColorFilter.mode(
                Color(0xff4F59621A),
                
                BlendMode.srcIn,
              ),
            ),
            SvgPicture.asset(
              AppAssets.group,
              fit: BoxFit.fitWidth,
            ),
            SvgPicture.asset(
              AppAssets.ellipse50,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              colorFilter: ColorFilter.mode(
                Color(0xff4F59621A),
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
