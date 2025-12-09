import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_outlines_button.dart';
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
              // Navigator.pushNamed(context, RoutesContants.settings);
              Navigator.pushNamed(context, RoutesContants.login);
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
          CustomOutlinedButton(
            text: 'Register',
            onPressed: () {
              Navigator.pushNamed(context, RoutesContants.register);
            },
          ),
          Gap(60),
        ],
      ),
    );
  }
}
