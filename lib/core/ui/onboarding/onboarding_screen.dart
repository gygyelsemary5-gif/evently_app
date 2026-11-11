import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_routs.dart';
import 'package:evently_app/core/utils/size_utils.dart';
import 'package:evently_app/l10n/app_localizations.dart';
import 'package:evently_app/providers/app_language_provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/app_styles.dart';
import 'option_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = SizeUtils.height(context);
    final loc = AppLocalizations.of(context)!;
    final languageProvider = Provider.of<AppLanguageProvider>(context);
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final theme = Theme.of(context);
    final isDark = themeProvider.appTheme == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(AppAssets.splash),
              Expanded(
                child: Center(
                  child: Image.asset(
                    isDark ? AppAssets.intro1_Dark : AppAssets.intro1,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(loc.personalizeYourExperience,
                  style: theme.textTheme.headlineLarge),
              SizedBox(height: height * 0.01),
              Text(loc.personalizeDescription, style: theme.textTheme.bodyLarge),
              SizedBox(height: height * 0.025),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loc.language, style: theme.textTheme.bodyMedium),
                  Row(
                    spacing: 8,
                    children: [
                      OptionButton(
                        label: loc.english,
                        isSelected: languageProvider.appLanguage == 'en',
                        onTap: () => languageProvider.changeLanguage('en'),
                      ),
                      OptionButton(
                        label: loc.arabic,
                        isSelected: languageProvider.appLanguage == 'ar',
                        onTap: () => languageProvider.changeLanguage('ar'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(loc.theme, style: theme.textTheme.bodyMedium),
                  Row(
                    spacing: 8,
                    children: [
                      OptionButton(
                        icon: Icons.wb_sunny_outlined,
                        isSelected: themeProvider.appTheme == ThemeMode.light,
                        onTap: () => themeProvider.changeTheme(ThemeMode.light),
                      ),
                      OptionButton(
                        icon: Icons.nightlight_outlined,
                        isSelected: themeProvider.appTheme == ThemeMode.dark,
                        onTap: () => themeProvider.changeTheme(ThemeMode.dark),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: height * 0.03),
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () => Navigator.pushReplacementNamed(
                      context, AppRouts.home),
                  child: Text(loc.letsStart, style: AppStyles.semi20White),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}