import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants/app_icons.dart';
import '../../l10n/app_localizations.dart';

class CustomBottomBar extends StatelessWidget {
  final int index;
  final ValueChanged<int> onTap;

  const CustomBottomBar({super.key, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.homeUnselected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            AppIcons.homeSelected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.favouriteUnselected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            AppIcons.favouriteSelected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          label: AppLocalizations.of(context)!.favorite,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AppIcons.profileUnselected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.unselectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: SvgPicture.asset(
            AppIcons.profileSelected,
            colorFilter: ColorFilter.mode(
              Theme.of(context).bottomNavigationBarTheme.selectedItemColor!,
              BlendMode.srcIn,
            ),
          ),
          label: AppLocalizations.of(context)!.profile,
        ),
      ],
      selectedFontSize: 15.sp,
      unselectedFontSize: 12.sp,
      currentIndex: index,
      onTap: onTap,
    );
  }
}
