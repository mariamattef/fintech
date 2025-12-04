import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_divider.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fintech/features/auth/presentation/widgets/fingure_or_faceid_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/remember_me_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_bottom_auth_widget.dart';
import 'package:fintech/features/auth/presentation/widgets/text_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = RoutesContants.login;
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _rememberMe = false;
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
                        title: 'Login To Your Account',
                        subtitle: 'Welcome back you’ve ',
                        subtile2: '\nbeen missed!',
                      ),
                      Gap(80),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hintText: 'E-mail ID',
                              icon: Icons.email_outlined,
                              controller: _emailController,
                            ),
                            Gap(10),
                            CustomTextFormField(
                              hintText: 'Password',
                              icon: Icons.lock_outline_rounded,
                              controller: _passwordController,
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
                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccess) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'You Logged In Successfully',
                                        ),
                                      ),
                                    );
                                  Navigator.pushReplacementNamed(
                                    context,
                                    RoutesContants.root,
                                  );
                                } else if (state is AuthFailure) {
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(content: Text(state.message)),
                                    );
                                }
                              },
                              builder: (context, state) {
                                if (state is AuthLoading) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return CustomElevationBottom(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                      );
                                    }
                                  },
                                  text: 'Login',
                                );
                              },
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
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      RoutesContants.register,
                                    );
                                  },
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
