import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TextHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtile2;
  const TextHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.subtile2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.heading26.copyWith(
            color: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : AppColors.primaryLightBlue300,
          ),
        ),
        Gap(20),
        Text(
          ' ${subtitle?? ''}  ${subtile2 ?? ''}'  ,
          textAlign: TextAlign.center,
          style: AppTextStyles.lMedium,
        ),
      ],
    );
  }
}
