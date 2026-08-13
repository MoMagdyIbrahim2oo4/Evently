import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

class EventCard extends StatefulWidget {
  EventCard({super.key});

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Container(
      height: 193.h,
      width: double.infinity,
      padding: EdgeInsets.all(8.r),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            themeProvider.isDark
                ? AppAssets.birthDayDark
                : AppAssets.birthDayLight,
          ),
          fit: BoxFit.fill,
        ),
        border: BoxBorder.all(color: Theme.of(context).colorScheme.onSecondary),
        borderRadius: BorderRadiusGeometry.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.all(8.r),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadiusGeometry.circular(8.r),
              border: BoxBorder.all(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            child: Text(
              "21 Jan",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadiusGeometry.circular(8.r),
              border: BoxBorder.all(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "This is a Birthday Party ",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isFavourite = !isFavourite;
                    });
                  },
                  icon: Icon(
                    isFavourite
                        ? Icons.favorite_outlined
                        : Icons.favorite_outline_outlined,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
