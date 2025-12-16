import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Splash extends StatefulWidget {
  static const String routeName = RoutesContants.splash;
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    context.read<AuthCubit>().checkAuthStatus();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.of(context).pushReplacementNamed(RoutesContants.root);
        } else if (state is AuthInitial || state is AuthFailure) {
          Navigator.of(context).pushReplacementNamed(RoutesContants.onboarding);
        }
      },
      child: Scaffold(
        body: Align(
          alignment: Alignment(0.2.w, 0.0),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              SvgPicture.asset(
                "assets/svg/icons/Ellipse 51 (1).svg",
                fit: BoxFit.fitWidth,
                width: double.infinity,
                colorFilter: const ColorFilter.mode(
                  Color(0xff4f59621a),
                  BlendMode.srcIn,
                ),
              ),
              SvgPicture.asset(
                'assets/svg/icons/Group.svg',
                fit: BoxFit.fitWidth,
              ),
              SvgPicture.asset(
                'assets/svg/icons/Ellipse 50.svg',
                fit: BoxFit.fitWidth,
                width: double.infinity,
                colorFilter: const ColorFilter.mode(
                  Color(0xff4f59621a),
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
