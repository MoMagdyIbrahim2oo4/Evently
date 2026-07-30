import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class AppTheme {

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      textTheme: TextTheme(
          headlineMedium: AppTextStyle.darkGray20SemiBold.copyWith(
              color: AppColors.darkGray),
          bodyMedium: AppTextStyle.mediumDarkGray16Regular.copyWith(
              color: AppColors.mediumDarkGray),
          titleMedium: AppTextStyle.darkBlue18Medium.copyWith(
              color: AppColors.darkBlue),
          labelMedium: AppTextStyle.white18Medium.copyWith(
              color: AppColors.white)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.darkBlue,
              shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 123.w)
          )
      )
  );

  static final ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.backgrounddark,
      textTheme: TextTheme(
        headlineMedium: AppTextStyle.darkGray20SemiBold.copyWith(
            color: AppColors.white),
        bodyMedium: AppTextStyle.mediumDarkGray16Regular.copyWith(
            color: AppColors.white),
        titleMedium: AppTextStyle.darkBlue18Medium.copyWith(
            color: AppColors.white),
        labelMedium: AppTextStyle.white18Medium.copyWith(
            color: AppColors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.lightBlue,
              shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(16.r)),
              padding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 123.w)
          )
      )
  );
}