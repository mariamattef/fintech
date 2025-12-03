import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/auth/presentation/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String img, name;
  const HeaderWidget({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 22, backgroundImage: NetworkImage(img)),
        const SizedBox(width: 12),
        Text(
          "Hi, $name  👋🏾",
          style: AppTextStyles.headingH6.copyWith(color: Color(0xFF1F1F1F)),
        ),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context,
              LoginScreen.routeName,
              (route) => false,
            );
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: Color(0xFF1A2C4F),
            size: 28,
          ),
        ),
      ],
    );
  }
}
