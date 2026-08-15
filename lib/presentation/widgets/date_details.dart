import 'package:evently/core/constants/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class DateDetails extends StatelessWidget {
  DateTime dateTime;

  DateDetails({super.key, required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadiusGeometry.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Row(
        spacing: 16.w,
        children: [
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadiusGeometry.circular(8.r),
              border: Border.all(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            child: SvgPicture.asset(
              AppIcons.calender,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.primary,
                BlendMode.srcIn,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: .start,
            spacing: 8.h,
            children: [
              Text(
                DateFormat('d MMMM').format(dateTime),
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                DateFormat('hh:mm a').format(dateTime),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
