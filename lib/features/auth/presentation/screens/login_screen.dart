<<<<<<< HEAD
import 'package:fintech/core/config/assets.dart';
=======
import 'package:fintech/core/routting/routes_contants.dart';
>>>>>>> auth
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
<<<<<<< HEAD
  static const String routeName = '/login';
=======
  static const String routeName = RoutesContants.login;
>>>>>>> auth
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
                      const Gap(100),
                      const TextHeader(
                        title: 'Login To Your Account',
                        subtitle: 'Welcome back you’ve ',
                        subtile2: '\nbeen missed!',
                      ),
<<<<<<< HEAD
                      const Gap(80),
=======
                      Gap(80),
>>>>>>> auth
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hintText: 'E-mail ID',
                              icon: Icons.email_outlined,
                              controller: _emailController,
                            ),
<<<<<<< HEAD
                            const Gap(10),
=======
                            Gap(10),
>>>>>>> auth
                            CustomTextFormField(
                              hintText: 'Password',
                              icon: Icons.lock_outline_rounded,
                              controller: _passwordController,
                            ),
<<<<<<< HEAD
                            const Gap(10),
=======
                            Gap(10),
>>>>>>> auth
                            RememberMeWidget(
                              rememberMe: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
<<<<<<< HEAD
                            const Gap(20),
=======
                            Gap(20),
>>>>>>> auth
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
<<<<<<< HEAD
                                    Root.routeName,
=======
                                    RoutesContants.root,
>>>>>>> auth
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
<<<<<<< HEAD
                            const Gap(40),
                            Column(
                              children: [
                                const CustomDivider(),
                                const Gap(40),
                                const FingerOrFaceIdWidget(),
                                const Gap(30),
=======
                            Gap(40),
                            Column(
                              children: [
                                CustomDivider(),
                                Gap(40),
                                FingerOrFaceIdWidget(),
                                Gap(30),
>>>>>>> auth
                                TextBottomAuthWidget(
                                  text: 'Don’t have an account?',
                                  text2: 'Sign Up',
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
<<<<<<< HEAD
                                      RegisterScreen.routeName,
                                    );
                                  },
                                ),
                                const Gap(30),
=======
                                      RoutesContants.register,
                                    );
                                  },
                                ),
                                Gap(30),
>>>>>>> auth
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
      ),
    );
  }
}
