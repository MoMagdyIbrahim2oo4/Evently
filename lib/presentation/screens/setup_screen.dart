import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/providers/app_localization_provider.dart';
import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

import '../widgets/settings.dart';

class SetupScreen extends StatelessWidget {
  SetupScreen({super.key});

  bool isEnglishSelected = true;

  @override
  Widget build(BuildContext context) {
    AppLocalizationProvider languageProvider = Provider.of(
      context,
      listen: true,
    );
    AppThemeProvider themeProvider = Provider.of(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: .start,
              spacing: 20.h,
              children: [
                Center(
                  child: Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? AppAssets.eventlyOnboardingDark
                        : AppAssets.eventlyOnboardingLight,
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: 343.w,
                    height: 343.h,
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppAssets.setupImageDark
                          : AppAssets.setupImageLight,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.personalizeyourexperience,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  AppLocalizations.of(context)!.setupText,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SettingsWidget(
                  title: AppLocalizations.of(context)!.language,
                  label1: AppLocalizations.of(context)!.english,
                  label2: AppLocalizations.of(context)!.arabic,
                  isFirstSelected: languageProvider.language == Locale("en"),
                  onFirstSelected: () {
                    languageProvider.changeLanguage("en");
                  },
                  onSecondSelected: () {
                    languageProvider.changeLanguage("ar");
                  },
                ),
                SettingsWidget(
                  title: AppLocalizations.of(context)!.theme,
                  icon1: Icons.wb_sunny,
                  icon2: Icons.dark_mode_outlined,
                  isFirstSelected: themeProvider.appTheme == ThemeMode.light,
                  onFirstSelected: () {
                    themeProvider.changeTheme(ThemeMode.light);
                  },
                  onSecondSelected: () {
                    themeProvider.changeTheme(ThemeMode.dark);
                  },
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.lets_start,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
