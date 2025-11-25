import 'package:fintech/core/config/extentions/custom_colors_extentions.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  bool get isDarkMode {
    return Theme.of(this).brightness == Brightness.dark;
  }

  CustomColors get customColors {
    return Theme.of(this).customColors;
  }
}
