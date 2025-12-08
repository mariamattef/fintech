import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/home/presentation/widgets/text_header_home.dart';
import 'package:flutter/material.dart';

class TrendingSectionHeader extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const TrendingSectionHeader({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextHeaderHome(header: title),
        TextButton(
          onPressed: onPressed,
          child: Text(
            "View all",
            style: AppTextStyles.textst12.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
