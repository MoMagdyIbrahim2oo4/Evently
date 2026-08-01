import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/cupertino.dart';

class OnboardingInfo {
  String imageLight;
  String imageDark;
  String title;
  String description;

  OnboardingInfo({
    required this.imageLight,
    required this.imageDark,
    required this.title,
    required this.description,
  });

  static List<OnboardingInfo> getInfo(BuildContext context) {
    return [
      OnboardingInfo(
        imageLight: AppAssets.onboarding1Light,
        imageDark: AppAssets.onboarding1Dark,
        title: AppLocalizations.of(context)!.onboaeding1title,
        description: AppLocalizations.of(context)!.onboarding1deccription,
      ),
      OnboardingInfo(
        imageLight: AppAssets.onboarding2Light,
        imageDark: AppAssets.onboarding2Dark,
        title: AppLocalizations.of(context)!.onboaeding2title,
        description: AppLocalizations.of(context)!.onboarding2deccription,
      ),
      OnboardingInfo(
        imageLight: AppAssets.onboarding3Light,
        imageDark: AppAssets.onboarding3Dark,
        title: AppLocalizations.of(context)!.onboaeding3title,
        description: AppLocalizations.of(context)!.onboarding3deccription,
      ),
    ];
  }
}
