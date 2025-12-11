import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CoinHeaderWidget extends StatelessWidget {
  final String name;
  final String imageUrl;

  const CoinHeaderWidget({
    super.key,
    required this.name,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 22, backgroundImage: NetworkImage(imageUrl)),
        const SizedBox(width: 12),
        Text(name, style: AppTextStyles.headingH5),
      ],
    );
  }
}
