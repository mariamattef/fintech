import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContentAppBar extends StatelessWidget {
  const CustomContentAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.0.r, top: 20.r),
      child: Text(
        'Crypto Market',
        style: AppTextStyles.headingH4.copyWith(
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
