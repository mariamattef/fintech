import 'package:fintech/core/config/assets.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/core/widgets/custom_outlines_button.dart';
import 'package:fintech/features/auth/presentation/screens/set_faceid_screen.dart';
import 'package:fintech/features/auth/presentation/widgets/face_id_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/fingure_print_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SetFaceidOrSkipScreen extends StatelessWidget {
  static const String routeName = '/setDaceidOrSkipScreen';
  const SetFaceidOrSkipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(30.r),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: FingurePrintWidget(
                      title: 'Set Your Face ID',
                      subtitle:
                          'Add your face ID to make your account more secure.',
                      child: FaceIdWidget(
                        stringImg: AppAssets.faceId,
                        onTap: () {},
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomOutlinedButton(
                        text: 'Skip',
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: 155.w,
                      ),
                      const Gap(20),
                      Expanded(
                        child: CustomElevationBottom(
                          text: 'Contenue',
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              SetFaceidScreen.routeName,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              AppAssets.ellipse52,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
