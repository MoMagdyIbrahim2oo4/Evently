import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Column(
            crossAxisAlignment: .start,
            spacing: 30.h,
            children: [
              Center(
                child: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? AppAssets.eventlyOnboardingDark
                      : AppAssets.eventlyOnboardingLight,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.logintoyouraccount,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
