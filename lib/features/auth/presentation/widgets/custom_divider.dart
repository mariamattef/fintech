import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: 1,
            color:
                Theme.of(context).brightness ==
                    Brightness.dark
                ? Color.fromRGBO(39, 52, 68, 1)
                : Color.fromRGBO(203, 213, 225, 1),
            indent: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Text(
            'Or login with',
            style: AppTextStyles.xsSemiBold.copyWith(
              color:
                  Theme.of(context).brightness ==
                      Brightness.dark
                  ? Colors.white
                  : AppColors.primaryLightBlue300,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color:
                Theme.of(context).brightness ==
                    Brightness.dark
                ? Color.fromRGBO(39, 52, 68, 1)
                : Color.fromRGBO(203, 213, 225, 1),
            endIndent: 30,
          ),
        ),
      ],
    );
  }
}
