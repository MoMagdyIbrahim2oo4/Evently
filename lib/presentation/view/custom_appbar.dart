import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/shared_pref.dart';
import '../../l10n/app_localizations.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          Image.asset(
            Theme.of(context).brightness == Brightness.dark
                ? AppAssets.eventlyOnboardingDark
                : AppAssets.eventlyOnboardingLight,
            fit: BoxFit.contain,
          ),
          OutlinedButton(
            onPressed: () async {
              await SharedPref.setKey();
              Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
            },
            child: Text(AppLocalizations.of(context)!.skip),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
