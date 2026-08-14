import 'package:evently/core/constants/app_assets.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/widgets/custom_text_button.dart';
import 'package:evently/presentation/widgets/custom_text_form_field.dart';
import 'package:evently/presentation/widgets/divide.dart';
import 'package:evently/presentation/widgets/google_button.dart';
import 'package:evently/presentation/widgets/my_Elevated_button.dart';
import 'package:evently/presentation/widgets/questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/providers/auth_provider.dart';
import '../../core/utils/toast_utils.dart';
import '../../core/utils/validation/validation.dart';
import '../widgets/dialog_content.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;

  TextEditingController emailController = TextEditingController(
      text: "Mohamed@gmail.com");

  TextEditingController passwordController = TextEditingController(
      text: "Ha442004");

  GlobalKey<FormState> formState = GlobalKey();

  Future<void> login() async {
    FocusScope.of(context).unfocus();
    showDialog(
      context: context,
      builder: (context) => Dialog(child: DialogContent(),),
      barrierDismissible: false,
    );
    final authProvider = context.read<AuthProvider>();
    final success = await authProvider.login(
      email: emailController.text,
      password: passwordController.text,
    );
    if (success) {
      Navigator.of(context).pop();
      FocusManager.instance.primaryFocus?.unfocus();
      ToastUtils.showToast(
        msg: AppLocalizations.of(context)!.loggedInSuccessfully,
        gravity: ToastGravity.TOP,
        backColor: Colors.green,
        textColor: Colors.white,
      );
      Navigator.of(
        context,
      ).pushNamedAndRemoveUntil(AppRoutes.mainLayoutScreen, (route) => false);
    } else {
      Navigator.of(context).pop();
      FocusManager.instance.primaryFocus?.unfocus();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(authProvider.errorMessage ?? "something went wrong"),
        ),
      );
    }
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
                    AppLocalizations.of(context)!.logintoyouraccount,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CustomTextFormField(
                    controller: emailController,
                    validator: (value) {
                      return Validation.emailValidation(context, value);
                    },
                    prefIcon: Icons.mail,
                    hint: AppLocalizations.of(context)!.enterYourEmail,
                  ),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: (value) {
                      return Validation.passwordValidation(context, value);
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
                        login();
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  Questions(
                    question: AppLocalizations.of(context)!.dontHaveAnAccount,
                    buttonLabel: AppLocalizations.of(context)!.signUp,
                    onpressed: () {
                      Navigator.of(context).pushNamed(AppRoutes.registerScreen);
                    },
                  ),
                  Divide(),
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
