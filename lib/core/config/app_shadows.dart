import 'package:fintech/core/config/app_color.dart';
import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();

  static BoxShadow shadow1 = BoxShadow(
    offset: const Offset(0, 6),
    blurRadius: 17,
    spreadRadius: 0,
    color: AppColors.shadow1Color.withValues(alpha: 0.013),
  );
}
