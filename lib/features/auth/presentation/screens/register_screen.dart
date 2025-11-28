import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/features/auth/presentation/screens/form_signup_widget.dart';
import 'package:fintech/features/auth/presentation/screens/login_screen.dart';
import 'package:fintech/features/auth/presentation/widgets/text_bottom_auth_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  static const String routename = '/register';
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Column(
                    children: [
                      Gap(100),
                      TextHeader(
                        title: 'Create Your Account',
                        subtitle: 'Sign up to enjoy the best managing ',
                        subtile2: '\nexperience!',
                      ),
                      Gap(50),
                      BlocProvider(
                        create: (context) => AuthCubit(),
                        child: FormSignUpWidget(),
                      ),
                      Gap(20),
                      TextBottomAuthWidget(
                        text: 'Don’t have an account?',
                        text2: 'Login',
                        onPressed: () {
                          Navigator.pushNamed(context, LoginScreen.routename);
                        },
                      ),
                      Gap(10),
                    ],
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
      ),
    );
  }
}
