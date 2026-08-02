import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../core/constants/app_colors.dart';
import '../../l10n/app_localizations.dart';

class Divide extends StatelessWidget {
  const Divide({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 10.w,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.lightBlue
                : AppColors.lightGray,
          ),
        ),
        Text(
          AppLocalizations.of(context)!.or,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: .w400,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.lightBlue
                : AppColors.darkBlue,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 10.w,
            color: Theme.of(context).brightness == Brightness.dark
                ? AppColors.lightBlue
                : AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
