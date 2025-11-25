import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/features/auth/presentation/screens/register_screen.dart';
import 'package:fintech/features/settings/presentation/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ButtonsInBoarding extends StatelessWidget {
  const ButtonsInBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.r),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingsScreen.routeName);
              // Navigator.pushNamed(context, LoginScreen.routename);
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity.r, 55),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31.r),
              ),
            ),
            child: Text('Login', style: AppTextStyles.lSemiBold),
          ),
          Gap(20),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, RegisterScreen.routename);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity.r, 50.r),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(31.r),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.primary,
                width: 2,
              ),
            ),
            child: Text('Register', style: AppTextStyles.lSemiBold),
          ),
          Gap(60),
        ],
      ),
    );
  }
}
