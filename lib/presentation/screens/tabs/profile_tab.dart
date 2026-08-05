import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/providers/app_localization_provider.dart';
import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/widgets/setting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            spacing: 15.h,
            children: [
              CircleAvatar(
                radius: 58.r,
                backgroundImage: AssetImage(AppAssets.routeProfile),
              ),
              Text("Route Academy", style: Theme
                  .of(context)
                  .textTheme
                  .bodyLarge),
              Text(
                "Route@gmail.com",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              SettingTile(
                label: AppLocalizations.of(context)!.darkMode,
                item: Switch(
                  activeTrackColor: AppColors.lightBlue,
                  inactiveTrackColor: AppColors.lightGray,
                  activeThumbColor: AppColors.white,
                  inactiveThumbColor: AppColors.white,
                  trackOutlineColor: WidgetStateProperty.all(
                      Colors.transparent),
                  value: themeProvider.isDark,
                  onChanged: (value) {
                    if (value) {
                      themeProvider.setThemeMode(ThemeMode.dark);
                    } else {
                      themeProvider.setThemeMode(ThemeMode.light);
                    }
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  showBottomSheet(context);
                },
                child: SettingTile(
                  label: AppLocalizations.of(context)!.language,
                  item: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                  ),
                ),
              ),
              SettingTile(
                label: AppLocalizations.of(context)!.logOut,
                item: Icon(Icons.logout, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showBottomSheet(BuildContext context) {
    showModalBottomSheet(context: context, builder: (context) => Sheet());
  }
}

class Sheet extends StatelessWidget {
  const Sheet({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEnglish = Localizations
        .localeOf(context)
        .languageCode == 'en';
    var languageProvider = Provider.of<AppLocalizationProvider>(context);
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme
                .of(context)
                .textTheme
                .headlineMedium,
          ),
          InkWell(
            onTap: () {
              languageProvider.setLocalization("en");
              Navigator.of(context).pop();
            },
            child: ListTile(
              leading: Text(
                AppLocalizations.of(context)!.english,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
              trailing: isEnglish ? Icon(Icons.check) : null,
            ),
          ),
          InkWell(
            onTap: () {
              languageProvider.setLocalization("ar");
              Navigator.of(context).pop();
            },
            child: ListTile(
              leading: Text(
                AppLocalizations.of(context)!.arabic,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
              trailing: isEnglish ? null : Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}
