import 'package:evently_app/core/utils/app_routs.dart';
import 'package:evently_app/core/utils/app_theme.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/ui/home.dart';
import 'core/ui/intro_screen/introduction_screen.dart';
import 'core/ui/onboarding/onboarding_screen.dart';
import 'l10n/app_localizations.dart';

void main() {
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create:((context) =>AppLanguageProvider() )),
          ChangeNotifierProvider(create:((context) =>AppThemeProvider() )),
        ],
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);

    return MaterialApp(
      locale: Locale(languageProvider.appLanguage),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouts.onboardingRouteName,
      routes: {
        AppRouts.onboardingRouteName: (context) => const OnboardingScreen(),
        AppRouts.home: (context) => const Home(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
    );
  }
}