import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/auth/presentation/screens/fingure_verified_screen.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';

class FingurePrintWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? text;
  final Widget child;

  const FingurePrintWidget({
    super.key,
    required this.title,
    this.text,
    this.subtitle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Spacer(),
        TextHeader(title: title, subtitle: subtitle ?? '', subtile2: ''),

        Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, FingureVerifiedScreen.routeName);
          },
          child: child,
        ),
        Spacer(),
        Text(
          text ?? '',
          style: AppTextStyles.lRegular,
          textAlign: TextAlign.center,
        ),
        Spacer(),
      ],
    );
  }
}