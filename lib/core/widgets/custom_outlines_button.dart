import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double? width;
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(width ?? double.infinity.r, 50.r),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(31.r),
        ),
        side: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 2,
        ),
      ),
      child: Text(text, style: AppTextStyles.lSemiBold),
    );
  }
}
