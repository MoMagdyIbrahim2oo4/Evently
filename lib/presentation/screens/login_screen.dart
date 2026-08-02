import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/utils/authentication/authentication.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/widgets/custom_text_button.dart';
import 'package:evently/presentation/widgets/custom_text_form_field.dart';
import 'package:evently/presentation/widgets/google_button.dart';
import 'package:evently/presentation/widgets/my_Elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../core/constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObsecured = true;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.r),
          child: Form(
            key: formState,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: .start,
                spacing: 10.h,
                children: [
                  Center(
                    child: Image.asset(
                      Theme.of(context).brightness == Brightness.dark
                          ? AppAssets.eventlyOnboardingDark
                          : AppAssets.eventlyOnboardingLight,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    AppLocalizations.of(context)!.logintoyouraccount,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) => Authentication.emailValidation(value),
                    prefIcon: Icons.mail,
                    hint: AppLocalizations.of(context)!.enterYourEmail,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) =>
                        Authentication.passwordValidation(value),
                    prefIcon: Icons.lock,
                    hint: AppLocalizations.of(context)!.enterYourPassword,
                    suffixIcon: isObsecured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isObscured: isObsecured,
                    obsecureChar: "*",
                    suffixPressed: () {
                      setState(() {
                        isObsecured = !isObsecured;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: .end,
                    children: [
                      CustomTextButton(
                        label: AppLocalizations.of(context)!.forgetPassword,
                        onpressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  MyElevatedButton(
                    label: AppLocalizations.of(context)!.login,
                    onpressed: () {
                      if (formState.currentState!.validate()) {
                        print("valid");
                      } else {
                        print("Invalid");
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      CustomTextButton(
                        label: AppLocalizations.of(context)!.signUp,
                        onpressed: () {},
                        underlined: true,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          endIndent: 10.w,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.lightBlue
                              : AppColors.lightGray,
                        ),
                      ),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: .w400,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.lightBlue
                              : AppColors.darkBlue,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          indent: 10.w,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.lightBlue
                              : AppColors.lightGray,
                        ),
                      ),
                    ],
                  ),
                  GoogleButton(
                    label: AppLocalizations.of(context)!.loginwithGoogle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
