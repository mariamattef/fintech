import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/cubit/theme_cubit.dart';
import 'package:fintech/core/config/language/cubit/language_cubit.dart';
import 'package:fintech/core/routting/routes_contants.dart';
import 'package:fintech/features/auth/presentation/cubits/auth_cubit/auth_cubit.dart';
import 'package:fintech/features/settings/presentation/widgets/dark_mode_toggle.dart';
import 'package:fintech/features/settings/presentation/widgets/profile_header.dart';
import 'package:fintech/features/settings/presentation/widgets/section_tile.dart';
import 'package:fintech/features/settings/presentation/widgets/settings_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = RoutesContants.settings;
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocListener<LanguageCubit, Languages>(
          listener: (context, local) {
            context.setLocale(Locale(local.name));
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Gap(50.h),
                Text(
                  "Settings".tr(),
                  style: AppTextStyles.headingH4.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Gap(20.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      final user = state.user;
                      final displayName = user.displayName ?? 'User'.tr();
                      final photoUrl = user.photoURL;
                      return ProfileHeader(
                        name: displayName,
                        backgroundImage: photoUrl != null
                            ? NetworkImage(photoUrl)
                            : null,
                        child: photoUrl == null
                            ? Icon(Icons.person, size: 40.sp)
                            : null,
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
                Gap(25.h),
                SectionTitle(title: "General".tr()),
                Gap(5.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/Profile.svg',
                  title: "My Account".tr(),
                  onTap: () {},
                ),
                Gap(20.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/Wallet.svg',
                  title: "Billing/Payment".tr(),
                  onTap: () {},
                ),
                Gap(20.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/FAQ.svg',
                  title: "FAQ & Support".tr(),
                  onTap: () {},
                ),
                Gap(20.h),
                SectionTitle(title: "Settings".tr()),
                SettingsItem(
                  assetName: 'assets/svg/icons/Discovery.svg',
                  title: "Language".tr(),
                  onTap: () {
                    context.read<LanguageCubit>().changeLanguage();
                  },
                ),
                DarkModeToggle(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (bool x) {
                    if (Theme.of(context).brightness == Brightness.dark) {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                    } else {
                      context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
