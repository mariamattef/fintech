import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CoinHeaderWidget extends StatelessWidget {
  const CoinHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.currency_bitcoin,
            color: Colors.orange,
            size: 32,
          ),
        ),
        const SizedBox(width: 12),
        Text("Bitcoin", style: AppTextStyles.headingH5),
      ],
    );
  }
}
