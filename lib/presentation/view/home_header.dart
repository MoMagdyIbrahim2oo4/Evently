import 'package:evently/data/model/event_type.dart';
import 'package:evently/presentation/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class HomeHeader extends StatelessWidget {
  List<EventType> categories;

  HomeHeader({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  "Welcome Back ✨",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "John Safwat",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Icon(
                Theme.of(context).brightness == Brightness.dark
                    ? Icons.dark_mode_outlined
                    : Icons.wb_sunny_outlined,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Text(
                Localizations.localeOf(context).languageCode == 'en'
                    ? "EN"
                    : "AR",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h,),
        TabBar(
          dividerColor: Colors.transparent,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.only(right: 10.w, left: 10.w),
          padding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          tabs: [
            for (final category in categories) CategoryTab(category: category),
          ],
        ),
      ],
    );
  }
}
