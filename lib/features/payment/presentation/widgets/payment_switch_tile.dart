import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class PaymentSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool) onChanged;

  const PaymentSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.textst12.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Switch(
          value: value,
         
          onChanged: onChanged,
          activeColor: Theme.of(context).colorScheme.surface,
          activeTrackColor: Theme.of(context).colorScheme.primary,
          inactiveThumbColor: Theme.of(context).colorScheme.primary,
          inactiveTrackColor: Colors.grey,
        ),
      ],
    );
  }
}
