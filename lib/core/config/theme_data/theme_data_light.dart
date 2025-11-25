import 'package:fintech/core/config/app_color.dart';
import 'package:fintech/core/config/app_fonts.dart';
import 'package:fintech/core/config/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundLightBlue,
    fontFamily: AppFonts.lato,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryLightBlue300,
      secondary: AppColors.primaryLightBlue50,
      surface: AppColors.grey0,
    ),

    textTheme: ThemeData.light().textTheme.apply(
      bodyColor: AppColors.grey900,
      displayColor: AppColors.grey900,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.scaffoldBackgroundLightBlue,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.grey900),
      titleTextStyle: TextStyle(color: AppColors.grey900),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryLightBlue300,
        foregroundColor: AppColors.grey0,
        disabledBackgroundColor: AppColors.grey100,
        disabledForegroundColor: AppColors.grey400,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        textStyle: AppTextStyles.mSemiBold,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey200),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: AppColors.grey200),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(
          color: AppColors.primaryLightBlue300,
          width: 2,
        ),
      ),
      filled: true,
      fillColor: AppColors.grey0,
      hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey0,
      elevation: 6,
      selectedItemColor: AppColors.primaryLightBlue300,
      unselectedItemColor: AppColors.grey400,
      selectedIconTheme: IconThemeData(color: AppColors.primaryLightBlue300),
    ),
  );
}

// ThemeData getLightTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: AppColors.scaffoldBackgroundLightBlue,
//     brightness: Brightness.light,
//     fontFamily: AppFonts.lato,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColors.primaryLightBlue300,
//       brightness: Brightness.light,
//     ),
//     appBarTheme: AppBarTheme(
//       backgroundColor: AppColors.scaffoldBackgroundLightBlue,
//       elevation: 0,
//     ),
//     textTheme: ThemeData.light().textTheme.apply(
//       bodyColor: AppColors.grey900,
//       displayColor: AppColors.grey900,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primaryLightBlue300,
//         foregroundColor: AppColors.grey0,
//         disabledBackgroundColor: AppColors.grey100,
//         disabledForegroundColor: AppColors.grey0,
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
//         borderSide: const BorderSide(color: AppColors.primaryLightBlue200),
//       ),
//       fillColor: WidgetStateColor.resolveWith((states) {
//         if (states.contains(WidgetState.focused)) {
//           return AppColors.primaryLightBlue0;
//         }
//         return AppColors.grey0;
//       }),
//       filled: true,
//       hintStyle: AppTextStyles.mRegular.copyWith(color: AppColors.grey400),
//     ),

//     bottomNavigationBarTheme: BottomNavigationBarThemeData(
//       elevation: 6,
//       type: BottomNavigationBarType.fixed,
//       selectedItemColor: AppColors.primaryLightBlue300,
//       selectedIconTheme: IconThemeData(color: AppColors.primaryLightBlue300),
//       unselectedItemColor: AppColors.grey400,
//       selectedLabelStyle: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w700,
//         color: AppColors.primaryLightBlue300,
//       ),
//       unselectedLabelStyle: TextStyle(
//         fontSize: 12.sp,
//         fontWeight: FontWeight.w400,
//         color: Color(0xFF979797),
//       ),
//     ),
//   );
// }

// ThemeData getLightTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: AppColors.scaffoldBackgroundColorLight,
//     brightness: Brightness.light,
//     fontFamily: AppFonts.robotoFont,
//     colorScheme: ColorScheme.fromSeed(
//       seedColor: AppColors.primaryColor,
//       brightness: Brightness.light,
//     ),
//     textTheme: ThemeData.light().textTheme.apply(
//       bodyColor: AppColors.textColorLight,
//       displayColor: AppColors.textColorLight,
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.primaryColor,
//         foregroundColor: AppColors.grey0,
//         disabledBackgroundColor: AppColors.grey100,
//         disabledForegroundColor: AppColors.grey0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         textStyle: AppTextStyles.lSemiBold,
//       ),
//     ),
//     inputDecorationTheme: InputDecorationTheme(
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(20.0),
//         borderSide: const BorderSide(color: AppColors.grey100),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(20.0),
//         borderSide: const BorderSide(color: AppColors.grey100),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(20.0),
//         borderSide: const BorderSide(color: AppColors.cardColorLight),
//       ),
//       fillColor: WidgetStateColor.resolveWith((states) {
//         if (states.contains(WidgetState.focused)) {
//           return AppColors.cardColorLight;
//         }
//         return AppColors.grey0;
//       }),
//       filled: true,
//       hintStyle: AppTextStyles.lMedium.copyWith(
//         color: AppColors.textColorLight,
//       ),
//     ),
//   );
// }
