import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class TextBottomAuthWidget extends StatelessWidget {
  final String text, text2;
  final void Function()? onPressed;

  const TextBottomAuthWidget({
    super.key,
    required this.text,
    required this.text2, this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: AppTextStyles.mMedium.copyWith(
            color: Color.fromRGBO(142, 148, 154, 1),
          ),
        ),
        TextButton(onPressed: onPressed, child: Text(text2)),
      ],
    );
  }
}
