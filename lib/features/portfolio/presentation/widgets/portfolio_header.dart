import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(
      "Portfolio",
      style: AppTextStyles.headingH4.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
    );
  }
}
