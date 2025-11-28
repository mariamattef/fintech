import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_fonts.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundDarkBlue,
    fontFamily: AppFonts.lato,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryDarkBlue300,
      secondary: AppColors.sky100,
      surface: AppColors.grey900,
    ),

    textTheme: ThemeData.dark().textTheme.apply(
      bodyColor: AppColors.grey0,
      displayColor: AppColors.grey0,
    ),

    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.scaffoldBackgroundDarkBlue,
      iconTheme: IconThemeData(color: AppColors.grey0),
      titleTextStyle: TextStyle(color: AppColors.grey0),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDarkBlue300,
        foregroundColor: AppColors.grey800,
        disabledBackgroundColor: AppColors.grey800,
        disabledForegroundColor: AppColors.grey400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        textStyle: AppTextStyles.mSemiBold,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.grey0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.grey0),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryDarkBlue300,
          width: 2,
        ),
      ),
      filled: true,
      prefixIconColor: Color(0xBFFFFFFF),
      fillColor: AppColors.scaffoldBackgroundDarkBlue,
      hintStyle: AppTextStyles.sMedium.copyWith(color: Color(0xff8C8C8C)),
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.primaryDarkBlue0,
      elevation: 6,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryLightBlue300,
      unselectedItemColor: AppColors.grey400,
    ),
  );
}

// ThemeData getDarkTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: AppColors.scaffoldBackgroundDarkBlue,
//     brightness: Brightness.dark,
//     fontFamily: AppFonts.lato,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColors.primaryDarkBlue300,
//       brightness: Brightness.dark,
//     ),
//     appBarTheme: AppBarTheme(
//       elevation: 0,
//       backgroundColor: AppColors.scaffoldBackgroundDarkBlue,
//     ),
//     textTheme: ThemeData.light().textTheme.apply(
//       bodyColor: AppColors.grey0,
//       displayColor: AppColors.grey0,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primaryDarkBlue300,
//         foregroundColor: AppColors.grey0,
//         disabledBackgroundColor: AppColors.grey800,
//         disabledForegroundColor: AppColors.grey400,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.r),
//         ),
//         textStyle: AppTextStyles.mSemiBold,
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.r),
//         borderSide: const BorderSide(color: AppColors.grey100),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.r),
//         borderSide: const BorderSide(color: AppColors.grey100),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10.r),
//         borderSide: const BorderSide(color: AppColors.primaryDarkBlue300),
//       ),
//       fillColor: WidgetStateColor.resolveWith((states) {
//         if (states.contains(WidgetState.focused)) {
//           return AppColors.primaryDarkBlue0;
//         }
//         return AppColors.grey800;
//       }),
//       filled: true,
//       hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
//     ),
//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       backgroundColor: AppColors.primaryDarkBlue0,
//       elevation: 6,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.primaryLightBlue300,
//       unselectedItemColor: Color(0xFF979797),
//     ),
//   );
// }
