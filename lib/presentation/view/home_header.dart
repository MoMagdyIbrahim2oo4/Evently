import 'package:evently/core/providers/auth_provider.dart';
import 'package:evently/data/model/event_type.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/widgets/event_type_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

class HomeHeader extends StatefulWidget {
  List<EventType> categories;
  void Function(int) onTapPressed;

  HomeHeader({super.key, required this.categories, required this.onTapPressed});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    return Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomeBack,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  authProvider.currentUser!.userName,
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
        SizedBox(height: 24.h),
        TabBar(
          dividerColor: Colors.transparent,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          labelPadding: EdgeInsets.only(right: 10.w, left: 10.w),
          padding: EdgeInsets.zero,
          indicatorColor: Colors.transparent,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            widget.onTapPressed(index);
          },
          tabs: widget.categories
              .map(
                (category) => EventTypeItem(
                  category: category,
                  isSelected:
                      currentIndex == widget.categories.indexOf(category),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
