import 'package:evently_app/core/utils/app_assets.dart';
import 'package:evently_app/core/utils/app_routs.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:evently_app/providers/app_theme_provider.dart';
import 'package:evently_app/core/utils/app_color.dart';
import 'package:evently_app/l10n/app_localizations.dart';

class IntroScreenView extends StatefulWidget {
  const IntroScreenView({super.key});

  @override
  State<IntroScreenView> createState() => _IntroScreenViewState();
}

class _IntroScreenViewState extends State<IntroScreenView> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<AppThemeProvider>(context);
    final isDark = themeProvider.appTheme == ThemeMode.dark;
    final loc = AppLocalizations.of(context)!;

    final backgroundColor = isDark ? AppColor.darkBgColor : AppColor.lightBgColor;
    final textColor = isDark ? Colors.white : AppColor.mainLightColor;
    final bodyColor = isDark ? Colors.white70 : Colors.black87;

    final List<IntroContent> pages = [
      IntroContent(
        title: loc.introTitle1,
        body: loc.introBody1,
        image: isDark ? AppAssets.intro2_Dark : AppAssets.intro2,
      ),
      IntroContent(
        title: loc.introTitle2,
        body: loc.introBody2,
        image: isDark ? AppAssets.intro3_Dark : AppAssets.intro3,
      ),
      IntroContent(
        title: loc.introTitle3,
        body: loc.introBody3,
        image: isDark ? AppAssets.intro4_Dark : AppAssets.intro4,
      ),
    ];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 48),
                  Image.asset(
                    isDark ? AppAssets.splash_Dark : AppAssets.splash,
                    height: 32,
                  ),
          OutlinedButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, AppRouts.onboardingRouteName);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                color: AppColor.mainLightColor,
                width: 1.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            ),
            child: Text(
              loc.skip,
              style: TextStyle(
                color: textColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              )))
             ],
              ),
              const SizedBox(height: 40),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            pages[index].image,
                            height: 350,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              pages.length,
                                  (dotIndex) => Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                height: 8,
                                width: _currentIndex == dotIndex ? 24 : 8,
                                decoration: BoxDecoration(
                                  color: _currentIndex == dotIndex
                                      ? AppColor.mainLightColor
                                      : Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 36),


                          Text(
                            pages[index].title,
                            style:isDark?AppStyles.medium20White:AppStyles.medium20MainColor,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),


                          Text(
                            pages[index].body,
                            style:isDark?AppStyles.medium16White:AppStyles.medium16MainDarkColor,

                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),


              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.mainLightColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    if (_currentIndex < pages.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.pushReplacementNamed(context, AppRouts.onboardingRouteName);
                    }
                  },
                  child: Text(
                    _currentIndex == pages.length - 1 ? loc.finish : loc.next,
                    style: AppStyles.semi20White,
                  ),
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}

// كلاس مساعد لتنظيم بيانات الصفحات
class IntroContent {
  final String title;
  final String body;
  final String image;

  IntroContent({
    required this.title,
    required this.body,
    required this.image,
  });
}