import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

class DarkModeToggle extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const DarkModeToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: AppColors.primaryLightBlue300,
        child: Icon(Icons.dark_mode_outlined, color: Colors.white),
      ),
      title: Text(
        "Dark Mode",
        style: AppTextStyles.mSemiBold.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: AppColors.primaryLightBlue300,
        activeColor: Colors.white,


        inactiveThumbColor: Colors.white,
        inactiveTrackColor: AppColors.primaryLightBlue300,
        // activeColor: AppColors.primaryLightBlue300,
      ),
    );
  }
}
