import 'package:fintech/features/auth/presentation/screens/faceid_verified_screen.dart';
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FaceIdScreen extends StatelessWidget {
  static const String routeName = '/faceIdScreen';
  const FaceIdScreen({super.key});

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
                  Spacer(flex: 2),
                  FaceIdWidget(
                    stringImg: 'assets/svg/icons/face id.svg',
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        FaceidVerifiedScreen.routeName,
                      );
                    },
                  ),
                  Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    'Please wait until your scanning is\ncomplete',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromRGBO(255, 255, 255, 1),
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
