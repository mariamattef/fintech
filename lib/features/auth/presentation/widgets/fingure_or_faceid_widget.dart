import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FingerOrFaceIdWidget extends StatelessWidget {
  const FingerOrFaceIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () =>
              Navigator.pushNamed(context, RoutesContants.fingurePrint),
          child: SvgPicture.asset(
            AppAssets.fingurePrint,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, RoutesContants.faceId);
          },
          child: SvgPicture.asset(
            AppAssets.faceId,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
