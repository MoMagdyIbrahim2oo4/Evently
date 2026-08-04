import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.darkBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.backgroundLight,
      onSecondary: AppColors.lightGray,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: Colors.black,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyle.darkGray20SemiBold.copyWith(
        color: AppColors.darkGray,
      ),
      bodyMedium: AppTextStyle.mediumDarkGray16Regular.copyWith(
        color: AppColors.mediumDarkGray,
      ),
      titleMedium: AppTextStyle.darkBlue18Medium.copyWith(
        color: AppColors.darkBlue,
      ),
      labelMedium: AppTextStyle.white18Medium.copyWith(color: AppColors.white),
      headlineLarge: AppTextStyle.darkGray20SemiBold.copyWith(
        color: AppColors.darkBlue,
      ),
      labelSmall: AppTextStyle.Medium14.copyWith(
        color: AppColors.mediumDarkGray,
      ),
      headlineSmall: AppTextStyle.darkGray20SemiBold.copyWith(
        color: AppColors.darkBlue,
      ),
      bodySmall: AppTextStyle.mediumDarkGray16Regular.copyWith(
        color: AppColors.mediumDarkGray,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkBlue,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 9.h),
        minimumSize: Size(double.infinity, 50.h),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.darkBlue,
        padding: EdgeInsets.all(5.r),
        side: BorderSide(color: AppColors.lightGray),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        fixedSize: Size(63, 32),
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundLight),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: AppColors.lightGray),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: AppColors.deepBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkBlue,
        padding: EdgeInsets.zero,
        textStyle: AppTextStyle.semiBold14,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      elevation: 0,
      selectedItemColor: AppColors.darkBlue,
      unselectedItemColor: AppColors.comfortGray,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
      shape: CircleBorder(),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgrounddark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.lightBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.backgrounddark,
      onSecondary: AppColors.lightBlue,
      error: Colors.red,
      onError: AppColors.white,
      surface: AppColors.backgrounddark,
      onSurface: AppColors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: AppTextStyle.darkGray20SemiBold.copyWith(
        color: AppColors.white,
      ),
      bodyMedium: AppTextStyle.mediumDarkGray16Regular.copyWith(
        color: AppColors.white,
      ),
      titleMedium: AppTextStyle.darkBlue18Medium.copyWith(
        color: AppColors.white,
      ),
      labelMedium: AppTextStyle.white18Medium.copyWith(color: AppColors.white),
      labelSmall: AppTextStyle.Medium14.copyWith(color: AppColors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 9.h),
        minimumSize: Size(double.infinity, 50.h),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.DarkNavyBlue,
        foregroundColor: AppColors.white,
        padding: EdgeInsets.all(5.r),
        side: BorderSide(color: AppColors.darkBlue),
        shape: RoundedSuperellipseBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        fixedSize: Size(63, 32),
      ),
    ),
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgrounddark),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.DarkNavyBlue,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: AppColors.deepBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: AppColors.deepBlue),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide(color: Colors.red),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgrounddark,
      elevation: 0,
      selectedItemColor: AppColors.lightBlue,
      unselectedItemColor: AppColors.comfortGray,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightBlue,
      foregroundColor: AppColors.white,
      shape: CircleBorder(),
    ),
  );
}
