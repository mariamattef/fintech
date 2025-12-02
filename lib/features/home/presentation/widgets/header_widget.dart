import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String img, name;
  const HeaderWidget({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundImage: NetworkImage(img), // Placeholder image
        ),
        const SizedBox(width: 12),
        Text(
          "Hi, $name  👋🏾",
          style: AppTextStyles.headingH6.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () async {},
          icon: Icon(
            Icons.notifications_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 28,
          ),
        ),
      ],
    );
  }
}
