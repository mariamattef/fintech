import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SetFaceidScreen extends StatelessWidget {
  static const String routeName = RoutesContants.setFaceid;
  const SetFaceidScreen({super.key});

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
                    'Place your face ID in face\nscanner until the icon completely',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.lMedium.copyWith(color: Colors.white),
                  ),
                  Spacer(flex: 2),
                  FaceIdWidget(
                    stringImg: 'assets/svg/icons/face id.svg',
                    onTap: () {
                      // if (didAuthenticate) {
                      //   Navigator.pushNamed(
                      //     context,
                      //     SetFaceidVerified.routeName,
                      //   );
                      // }
                      Navigator.pushNamed(context, RoutesContants.setFaceidVerified);
                    },
                  ),
                  Spacer(),
                  Text(
                    textAlign: TextAlign.center,
                    'Once your scanning is complete, you will be able to sign in by using face ID',
                    style: TextStyle(
                      fontSize: 18.sp,
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
