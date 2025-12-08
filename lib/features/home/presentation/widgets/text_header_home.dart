import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class TextHeaderHome extends StatelessWidget {
  final String header;
  const TextHeaderHome({super.key, required this.header});

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style: AppTextStyles.mMedium.copyWith(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}