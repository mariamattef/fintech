import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FingerOrFaceIdWidget extends StatelessWidget {
  const FingerOrFaceIdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          'assets/images/Group 2257.png',
          height: 50.h,
          width: 50.w,
          fit: BoxFit.contain,
        ),
        Image.asset(
          'assets/images/Face ID.png',
          height: 50.h,
          width: 50.w,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
