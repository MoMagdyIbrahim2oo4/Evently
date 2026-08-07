import 'package:evently/data/model/event_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoryTab extends StatelessWidget {
  EventType category;

  CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: Theme.of(context).colorScheme.onSecondary),
        ),
        child: Row(
          children: [
            FaIcon(category.icon),
            SizedBox(width: 8.w),
            Text(category.type),
          ],
        ),
      ),
    );
  }
}
