import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../core/constants/app_colors.dart';

class SettingsWidget extends StatelessWidget {
  final String title;

  final String? label1;
  final String? label2;

  final IconData? icon1;
  final IconData? icon2;

  final bool isFirstSelected;

  final VoidCallback onFirstSelected;
  final VoidCallback onSecondSelected;

  const SettingsWidget({
    super.key,
    required this.title,
    this.label1,
    this.label2,
    this.icon1,
    this.icon2,
    required this.isFirstSelected,
    required this.onFirstSelected,
    required this.onSecondSelected,
  }) : assert(
         ((label1 != null && label2 != null) !=
             (icon1 != null && icon2 != null)),
         'Enter one of labels or icons only',
       );

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Theme(
      data: Theme.of(context).copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
        ),
      ),
      child: Row(
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const Spacer(),
          Padding(
            padding: EdgeInsets.all(4.r),
            child: ElevatedButton(
              onPressed: onFirstSelected,
              style: ElevatedButton.styleFrom(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                backgroundColor: isFirstSelected
                    ? (isDark ? AppColors.lightBlue : AppColors.darkBlue)
                    : (isDark ? AppColors.DarkNavyBlue : AppColors.white),
                foregroundColor: isFirstSelected
                    ? AppColors.white
                    : (isDark ? AppColors.white : AppColors.darkBlue),
              ),
              child: label1 != null ? Text(label1!) : Icon(icon1),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(4.r),
            child: ElevatedButton(
              onPressed: onSecondSelected,
              style: ElevatedButton.styleFrom(
                shape: RoundedSuperellipseBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                backgroundColor: !isFirstSelected
                    ? (isDark ? AppColors.lightBlue : AppColors.darkBlue)
                    : (isDark ? AppColors.DarkNavyBlue : AppColors.white),
                foregroundColor: !isFirstSelected
                    ? AppColors.white
                    : (isDark ? AppColors.white : AppColors.darkBlue),
              ),
              child: label2 != null ? Text(label2!) : Icon(icon2),
            ),
          ),
        ],
      ),
    );
  }
}
