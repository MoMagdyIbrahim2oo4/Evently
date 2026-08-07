import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/constants/app_colors.dart';
import '../../data/model/onboarding_info.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.controller,
    required this.infoList,
  });

  final PageController controller;
  final List<OnboardingInfo> infoList;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: infoList.length,
      effect: ExpandingDotsEffect(
        activeDotColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.lightBlue
            : AppColors.darkBlue,
        dotColor: Theme.of(context).brightness == Brightness.dark
            ? AppColors.backgroundLight
            : AppColors.comfortGray,
      ),
    );
  }
}
