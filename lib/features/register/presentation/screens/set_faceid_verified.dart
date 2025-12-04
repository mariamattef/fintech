import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SetFaceidVerified extends StatelessWidget {
  static const String routeName = RoutesContants.setFaceidVerified;
  const SetFaceidVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset('assets/images/bg.png', fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(100),

                  Text(
                    'You’re Ready!',
                    style: AppTextStyles.heading26.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(flex: 2),
                  FaceIdWidget(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesContants.root,
                        (route) => false,
                      );
                    },
                    stringImg: 'assets/svg/icons/Component 1.svg',
                  ),

                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity.r, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(31.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesContants.root,
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Continue",
                      style: AppTextStyles.lSemiBold.copyWith(
                        color: AppColors.primaryLightBlue300,
                      ),
                    ),
                  ),

                  Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
