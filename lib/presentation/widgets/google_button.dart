import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  String label;

  GoogleButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.DarkNavyBlue
            : AppColors.white,
        side: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.deepBlue
              : AppColors.lightGray,
        ),
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: SvgPicture.asset(AppIcons.googleIcon),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: .w600,
              color: Theme.of(context).brightness == Brightness.dark
                  ? AppColors.lightBlue
                  : AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }
}
