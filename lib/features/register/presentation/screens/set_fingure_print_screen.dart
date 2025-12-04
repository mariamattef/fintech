import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_outlines_button.dart';
import 'package:fintech/features/auth/presentation/widgets/fingure_Print_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SetFingurePrintScreen extends StatelessWidget {
  static const String routeName = RoutesContants.setFingurePrint;
  const SetFingurePrintScreen({super.key});

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
                      title: 'Set Your Finger Print',
                      subtitle:
                          'Add a fingerprint to make your account more secure.',
                      text:
                          'Place your finger in fingerprint\nsensor until the icon completely',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesContants.setFingurePrintVerified,
                          );
                        },
                        child: SvgPicture.asset(
                          'assets/svg/icons/Group 2258.svg',
                          height: 140,
                          width: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomOutlinedButton(
                        text: 'Skip',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RoutesContants.setFaceid,
                          );

                          Navigator.pushNamed(
                            context,
                            RoutesContants.setFaceidOrSkip,
                          );
                        },
                        width: 140.w,
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
              'assets/svg/icons/Ellipse 52.svg',
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
