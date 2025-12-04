<<<<<<< HEAD
import 'package:fintech/core/config/assets.dart';
import 'package:fintech/features/auth/presentation/screens/face_id_screen.dart';
import 'package:fintech/features/auth/presentation/screens/fingure_print_screen.dart';
=======
import 'package:fintech/features/login/presentation/screens/face_id_screen.dart';
import 'package:fintech/features/login/presentation/screens/fingure_print_screen.dart';
>>>>>>> auth
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
          onTap: () =>   Navigator.pushNamed(context, FingurePrintScreen.routeName),
          child: SvgPicture.asset(
            AppAssets.fingurePrint,
            height: 50.h,
            width: 50.w,
            fit: BoxFit.contain,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, FaceIdScreen.routeName);
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