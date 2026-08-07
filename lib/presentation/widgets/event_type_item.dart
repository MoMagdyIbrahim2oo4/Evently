import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/data/model/event_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EventTypeItem extends StatelessWidget {
  EventType category;
  bool isSelected;

  EventTypeItem({super.key, required this.category, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).highlightColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
      ),
      child: Row(
        children: [
          FaIcon(
            category.icon,
            color: isSelected
                ? AppColors.white
                : Theme.of(context).colorScheme.primary,
          ),
          SizedBox(width: 8.w),
          Text(
            category.type,
            style: isSelected
                ? Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: AppColors.white)
                : Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
