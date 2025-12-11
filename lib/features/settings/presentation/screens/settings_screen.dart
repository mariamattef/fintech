import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:fintech/core/config/cubit/theme_cubit.dart';
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),
                Text(
                  "Settings",
                  style: AppTextStyles.headingH4.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                Gap(20.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccess) {
                      final user = state.user;
                      final displayName = user.displayName ?? 'User';
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
                    return SizedBox.shrink();
                  },
                ),
                Gap(25.h),
                const SectionTitle(title: "General"),
                Gap(5.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/Profile.svg',
                  title: "My Account",
                  onTap: () {},
                ),
                Gap(20.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/Wallet.svg',
                  title: "Billing/Payment",
                  onTap: () {},
                ),
                Gap(20.h),
                SettingsItem(
                  assetName: 'assets/svg/icons/FAQ.svg',
                  title: "FAQ & Support",
                  onTap: () {},
                ),
                Gap(20.h),
                const SectionTitle(title: "Settings"),
                SettingsItem(
                  assetName: 'assets/svg/icons/FAQ.svg',
                  title: "Language".tr(),
                  onTap: () {
                    // if (value) {
                    //   context.setLocale(const Locale('ar'));
                    // } else {
                    //   context.setLocale(const Locale('en'));
                    // }
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

// class SettingsScreen extends StatelessWidget {
//   static const String routeName = RoutesContants.settings;
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return 
    
//     Scaffold(
//       appBar: AppBar(
//         title: Text('settings'.tr()),
//         actions: [
//           Switch(
//             value: context.isDarkMode,
//             onChanged: (bool x) {
//               if (context.isDarkMode) {
//                 context.read<ThemeCubit>().updateTheme(ThemeMode.light);
//               } else {
//                 context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
//               }
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             ListTile(
//               title: Text('language'.tr()),
//               trailing: Switch(
//                 value: context.locale == const Locale('ar'),
//                 onChanged: (value) {
//                   if (value) {
//                     context.setLocale(const Locale('ar'));
//                   } else {
//                     context.setLocale(const Locale('en'));
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
  
  
  
   
   
   
//     );
//   }
// }
