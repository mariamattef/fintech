import 'package:fintech/core/widgets/custom_elevation_botton.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:fintech/features/auth/presentation/screens/login_screen.dart';
import 'package:fintech/features/home/presentation/screens/crypto_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class FormSignUpWidget extends StatefulWidget {
  const FormSignUpWidget({super.key});

  @override
  State<FormSignUpWidget> createState() => _FormSignUpWidgetState();
}

class _FormSignUpWidgetState extends State<FormSignUpWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _fNameController.dispose();
    _lNameController.dispose();
    _confirmPassController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: _fNameController,
            hintText: 'First Name',
            icon: Icons.person_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            controller: _lNameController,
            hintText: 'Last Name',
            icon: Icons.person_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            controller: _emailController,
            hintText: 'E-mail ID',
            icon: Icons.email_outlined,
          ),
          Gap(10),
          CustomTextFormField(
            controller: _passwordController,
            hintText: 'Password',
            icon: Icons.lock_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            controller: _confirmPassController,
            hintText: 'Confirm Password',
            icon: Icons.lock_outline_rounded,
          ),
          Gap(10),
          CustomTextFormField(
            hintText: 'xxx xxx xxxx',
            icon: Icons.phone_outlined,
            controller: _phoneController,
          ),
          Gap(30),
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Account created successfully')),
                );
                Navigator.pushReplacementNamed(context, LoginScreen.routename);
              } else if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return CustomElevationBottom(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signUp(
                          firstName: _fNameController.text,
                          lastName: _lNameController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          confirmPassword: _confirmPassController.text,
                          phone: _phoneController.text,
                        );
                  }
                },
                text: 'Sign Up',
              );
            },
          ),
          Gap(10),
        ],
      ),
    );
  }
}