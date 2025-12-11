import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: AppTextStyles.mSemiBold.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
