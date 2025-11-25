import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevationBottom extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const CustomElevationBottom({
    super.key, this.onPressed, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity.r, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.r),
        ),
      ),
      child: Text(text, style: AppTextStyles.lSemiBold),
    );
  }
}
