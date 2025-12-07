<<<<<<< HEAD:lib/features/auth/presentation/screens/face_id_screen.dart
import 'package:fintech/core/config/assets.dart';
import 'package:fintech/features/auth/presentation/screens/faceid_verified_screen.dart';
=======
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/auth/presentation/biometrics_service.dart';
>>>>>>> auth:lib/features/login/presentation/screens/face_id_screen.dart
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FaceIdScreen extends StatelessWidget {
    static const String routeName = RoutesContants.faceId;
  const FaceIdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Opacity(
              opacity: 0.9,
              child: Image.asset(AppAssets.bg, fit: BoxFit.cover),
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
                  Spacer(flex: 2),
                  FaceIdWidget(
                    stringImg: AppAssets.faceId,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        FaceidVerifiedScreen.routeName,
                      );
                    },
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
