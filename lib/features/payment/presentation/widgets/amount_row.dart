import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/payment/presentation/widgets/currency_selector.dart';
import 'package:flutter/material.dart';

class AmountRow extends StatelessWidget {
  final String title, amount, code;
  final IconData icon;
  const AmountRow({
    super.key,
    required this.title,
    required this.amount,
    required this.code,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.textst12.copyWith(
                color: Color(0xff949494),
              ),
            ),
            const SizedBox(height: 5),
            Text(amount, style: AppTextStyles.headingH5.copyWith(color: Theme.of(context).colorScheme.primary)),
          ],
        ),
        CurrencySelector(code: code, icon: icon,),
      ],
    );
  }
}
