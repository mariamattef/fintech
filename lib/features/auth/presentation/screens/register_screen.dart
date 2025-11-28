import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/screens/set_fingure_print_screen.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fintech/features/auth/presentation/widgets/text_bottom_auth_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  static const String routename = '/register';
  const RegisterScreen({super.key});

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
                    title: 'Create Your Account',
                    subtitle: 'Sign up to enjoy the best managing ',
                    subtile2: '\nexperience!',
                  ),
                  Gap(50),
                  FormSignUpWidget(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        SetFingurePrintScreen.routeName,
                      );
                    },
                  ),
                  Gap(20),
                  TextBottomAuthWidget(
                    text: 'Don’t have an account?',
                    text2: 'Login',
                    onPressed: () {},
                  ),
                  Gap(10),
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

class FormSignUpWidget extends StatelessWidget {
  final void Function() onPressed;
  const FormSignUpWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'First Name',
            icon: Icons.person_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            hintText: 'Last Name',
            icon: Icons.person_outline_rounded,
          ),
          Gap(10),
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
          CustomTextFormField(
            hintText: 'Confirm Password',
            icon: Icons.lock_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            hintText: 'xxx xxx xxxx',
            icon: Icons.phone_outlined,
          ),
          Gap(30),
          CustomElevationBottom(onPressed: onPressed, text: 'Sign Up'),
          Gap(10),
        ],
      ),
    );
  }
}
