import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RememberMeWidget extends StatelessWidget {
  final bool rememberMe;
  final void Function(bool?)? onChanged;
  const RememberMeWidget({super.key, required this.rememberMe, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(4.r),
                side: BorderSide(color: Theme.of(context).colorScheme.primary),
              ),
              value: rememberMe,
              onChanged: onChanged,
            ),
            Text(
              'Remember me',
              style: AppTextStyles.xsSemiBold.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.primaryLightBlue300
                    : Color.fromRGBO(47, 65, 89, 1),
              ),
            ),
          ],
        ),
        Text(
          'Forgot Password?',
          style: AppTextStyles.xsSemiBold.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : AppColors.primaryLightBlue300,
          ),
        ),
      ],
    );
  }
}
