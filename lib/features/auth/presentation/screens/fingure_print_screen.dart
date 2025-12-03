import 'package:fintech/features/auth/presentation/biometrics_service.dart';
import 'package:fintech/features/auth/presentation/widgets/fingure_Print_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FingurePrintScreen extends StatelessWidget {
  static const String routeName = '/fingerprintscreen';
  const FingurePrintScreen({super.key});

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
              child: FingurePrintWidget(
                title: 'Touch ID sensor to verify yourself',
                text:
                    'Please verify your identity using touch ID and it will proceed automatically.',
                child: GestureDetector(
                  onTap: () => authFingerprint(context),
                  child: SvgPicture.asset(
                    'assets/svg/icons/Group 2258.svg',
                    colorFilter: ColorFilter.mode(
                      Color.fromRGBO(114, 122, 129, 1),

                      BlendMode.srcIn,
                    ),
                  ),
                ),
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