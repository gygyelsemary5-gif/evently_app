import 'package:evently_app/core/utils/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_theme_provider.dart';
import 'intro_screen/introduction_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override

  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.appTheme == ThemeMode.dark;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: IntroScreenView(),
            ),
          ],
        ),
      ),
    );
  }
}