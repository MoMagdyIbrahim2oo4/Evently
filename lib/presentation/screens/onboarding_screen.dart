import 'package:evently/core/constants/app_colors.dart';
import 'package:evently/core/utils/app_routes.dart';

// import 'package:evently/core/utils/shared_pref.dart';
import 'package:evently/data/model/onboarding_info.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/view/custom_appbar.dart';

// import 'package:evently/presentation/widgets/my_elevated_button.dart';
import 'package:evently/presentation/widgets/title_description.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../core/constants/app_assets.dart';

import '../../core/utils/shared_pref.dart';
import '../widgets/indicator.dart';
import '../widgets/my_Elevated_button.dart';

class OnboardingScreen extends StatefulWidget {
  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<OnboardingInfo> infoList = OnboardingInfo.getInfo(context);
    return Scaffold(
      appBar: CustomAppbar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20.h,
              children: [
                SizedBox(
                  width: 343.w,
                  height: 343.h,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: infoList.length,
                    itemBuilder: (context, index) => SizedBox(
                      child: Image.asset(
                        Theme.of(context).brightness == Brightness.dark
                            ? infoList[index].imageDark
                            : infoList[index].imageLight,
                      ),
                    ),
                    onPageChanged: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Center(
                  child: Indicator(controller: controller, infoList: infoList),
                ),
                SizedBox(
                  height: 235.h,
                  child: TitleDescription(
                    title: infoList[currentIndex].title,
                    description: infoList[currentIndex].description,
                  ),
                ),
                Visibility(
                  visible: currentIndex < infoList.length - 1,
                  replacement: MyElevatedButton(
                    label: AppLocalizations.of(context)!.getStarted,
                    onpressed: () async {
                      await SharedPref.setKey();
                      Navigator.of(
                        context,.pushNamedAndRemoveUntil(
                        AppRoutes.loginScreen,
                        (routes) => false,
                      );
                    },
                  ),
                  child: MyElevatedButton(
                    label: AppLocalizations.of(context)!.next,
                    onpressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
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
