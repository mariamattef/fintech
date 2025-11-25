import 'package:easy_localization/easy_localization.dart';
import 'package:fintech/core/config/cubit/theme_cubit.dart';
import 'package:fintech/core/config/extentions/theme_extentions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  static const String routeName = '/settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = true;
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
        actions: [
          Switch(
            value: isDark,
            onChanged: (bool x) {
              if (context.isDarkMode) {
                context.read<ThemeCubit>().updateTheme(ThemeMode.light);
              } else {
                context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              title: Text('language'.tr()),
              trailing: Switch(
                value: context.locale == const Locale('ar'),
                onChanged: (value) {
                  if (value) {
                    context.setLocale(const Locale('ar'));
                  } else {
                    context.setLocale(const Locale('en'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
