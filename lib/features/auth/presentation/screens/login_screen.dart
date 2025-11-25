import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/widgets/Finfer_or_faceid_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_divider.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_text_frm_field.dart';
import 'package:fintech/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_bottom_auth_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  static const String routename = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Spacer(),
                  TextHeader(
                    title: 'Login To Your Account',
                    subtitlle: 'Welcome back you’ve ',
                    subtile2: '\nbeen missed!',
                  ),

                  Gap(50),
                  Form(
                    child: Column(
                      children: [
                        CustomTextFormField(
                          hintText: 'E-mail ID',
                          icon: Icons.email_outlined,
                        ),
                        Gap(10),
                        CustomTextFormField(
                          hintText: 'Password',
                          icon: Icons.lock_outline_rounded,
                        ),
                        Gap(10),
                        RememberMeWidget(
                          rememberMe: _rememberMe,
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value!;
                            });
                          },
                        ),
                        Gap(20),
                        CustomElevationBottom(
                          onPressed: () {
                            Navigator.pushNamed(context, LoginScreen.routename);
                          },
                          text: 'Login',
                        ),
                        Gap(40),
                        Column(
                          children: [
                            CustomDivider(),
                            Gap(40),
                            FingerOrFaceIdWidget(),
                            Gap(30),
                            TextBottomAuthWidget(
                              text: 'Don’t have an account?',
                              text2: 'Sign Up',
                              onPressed: () {},
                            ),
                            Gap(30),
                          ],
                        ),
                      ],
                    ),
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
