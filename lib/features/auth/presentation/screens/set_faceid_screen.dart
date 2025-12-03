import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/assets.dart';
import 'package:fintech/features/auth/presentation/screens/set_faceid_verified.dart';
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SetFaceidScreen extends StatelessWidget {
  static const String routeName = '/setfaceIdScreen';
  const SetFaceidScreen({super.key});

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
                  const Gap(100),
                  Text(
                    'Place your face ID in face\nscanner until the icon completely',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.lMedium.copyWith(color: Colors.white),
                  ),
                  const Spacer(flex: 2),
                  FaceIdWidget(
                    stringImg: AppAssets.faceId,
                    onTap: () {
                      Navigator.pushNamed(context, SetFaceidVerified.routeName);
                    },
                  ),
                  const Spacer(),
                  const Text(
                    textAlign: TextAlign.center,
                    'Once your scanning is complete, you will be able to sign in by using face ID',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
