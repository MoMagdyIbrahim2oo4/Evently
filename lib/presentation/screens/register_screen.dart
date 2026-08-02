import 'package:evently/presentation/widgets/custom_text_form_field.dart';
import 'package:evently/presentation/widgets/google_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';

import '../../core/constants/app_assets.dart';
import '../../core/utils/app_routes.dart';
import '../../core/utils/authentication/authentication.dart';
import '../../l10n/app_localizations.dart';
import '../widgets/divide.dart';
import '../widgets/my_Elevated_button.dart';
import '../widgets/questions.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isObscured = true;
  bool isConfirmObscured = true;
  String confirmPassword = '';

  TextEditingController usernameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    passwordController.addListener(() {
      confirmPassword = confirmPasswordController.text;
    });
  }

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
                    AppLocalizations.of(context)!.createYourAccount,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextFormField(
                    controller: usernameController,
                    validator: (value) {
                      return Authentication.usernameValidation(context, value);
                    },
                    prefIcon: Icons.person_2_outlined,
                    hint: AppLocalizations.of(context)!.enterYourName,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      return Authentication.emailValidation(context, value);
                    },
                    prefIcon: Icons.mail,
                    hint: AppLocalizations.of(context)!.enterYourEmail,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      return Authentication.passwordValidation(context, value);
                    },
                    prefIcon: Icons.lock,
                    hint: AppLocalizations.of(context)!.enterYourPassword,
                    suffixIcon: isObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isObscured: isObscured,
                    obsecureChar: "*",
                    suffixPressed: () {
                      setState(() {
                        isObscured = !isObscured;
                      });
                    },
                  ),
                  CustomTextFormField(
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value != confirmPassword) {
                        return AppLocalizations.of(
                          context,
                        )!.invalidConfirmation;
                      } else {
                        return null;
                      }
                    },
                    prefIcon: Icons.lock,
                    hint: AppLocalizations.of(context)!.enterYourPassword,
                    suffixIcon: isConfirmObscured
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    isObscured: isConfirmObscured,
                    obsecureChar: "*",
                    suffixPressed: () {
                      setState(() {
                        isConfirmObscured = !isConfirmObscured;
                      });
                    },
                  ),
                  SizedBox(height: 20.h),
                  MyElevatedButton(
                    label: AppLocalizations.of(context)!.signUp2,
                    onpressed: () {
                      if (formState.currentState!.validate()) {
                        print("valid");
                      } else {
                        print("Invalid");
                      }
                    },
                  ),
                  Questions(
                    question: AppLocalizations.of(
                      context,
                    )!.alreadyHaveAnAccount,
                    buttonLabel: AppLocalizations.of(context)!.login,
                    onpressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  Divide(),
                  GoogleButton(
                    label: AppLocalizations.of(context)!.signUpWithgoogle,
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
