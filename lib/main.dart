import 'package:evently/core/providers/app_theme_provider.dart';
import 'package:evently/core/providers/auth_provider.dart';
import 'package:evently/core/utils/app_routes.dart';
import 'package:evently/core/utils/app_theme.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/presentation/screens/add_event_screen.dart';
import 'package:evently/presentation/screens/datails_screen.dart';
import 'package:evently/presentation/screens/login_screen.dart';
import 'package:evently/presentation/screens/main_layout_screen.dart';
import 'package:evently/presentation/screens/onboarding_screen.dart';
import 'package:evently/presentation/screens/register_screen.dart';
import 'package:evently/presentation/screens/setup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

import 'core/providers/app_localization_provider.dart';
import 'core/utils/shared_pref.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  bool isOnboardingSeen = await SharedPref.getKey();


  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AppLocalizationProvider()),
              ChangeNotifierProvider(create: (_) => ThemeProvider()),
              ChangeNotifierProvider(create: (_) =>
              AuthProvider()
                ..listenToAuthChanges()),
            ],
            child: MyApp(isOnboardingSeen: isOnboardingSeen,),
          ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isOnboardingSeen;

  MyApp({super.key, required this.isOnboardingSeen});


  @override
  Widget build(BuildContext context) {
    AppLocalizationProvider languageProvider = Provider.of(
        context, listen: true);
    ThemeProvider themeProvider = Provider.of(context, listen: true);
    return ScreenUtilPlusInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
            title: 'Evently',
            debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.setupScreen: (context) => SetupScreen(),
            AppRoutes.onboardingScreen: (context) => OnboardingScreen(),
            AppRoutes.loginScreen: (context) => LoginScreen(),
            AppRoutes.registerScreen:(context)=>RegisterScreen(),
            AppRoutes.mainLayoutScreen: (context) => MainLayoutScreen(),
            AppRoutes.addEventScreen: (context) => AddEventScreen(),
            AppRoutes.detailsScreen: (context) => DetailsScreen(),
          },
            home: _Gate(isOnboardingSeen: isOnboardingSeen),
            // initialRoute: isOnboardingSeen ?
            // AppRoutes.loginScreen :
            // AppRoutes.setupScreen,
          // initialRoute: AppRoutes.setupScreen,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.themeMode,
            // themeMode: ThemeMode.light,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: languageProvider.language
          // locale: Locale("en"),
        );
      },
    );
  }
}

class _Gate extends StatelessWidget {
  final bool isOnboardingSeen;

  _Gate({super.key, required this.isOnboardingSeen});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (!isOnboardingSeen) {
      return SetupScreen();
    }
    if (authProvider.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator(),),);
    }
    if (authProvider.currentUser == null) {
      return LoginScreen();
    }
    else {
      return MainLayoutScreen();
    }
  }
}

