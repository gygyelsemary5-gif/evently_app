import 'package:evently_app/core/utils/app_color.dart';
import 'package:evently_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.lightBgColor,
    primaryColor: AppColor.mainLightColor,
    dividerColor: AppColor.strokeWhiteColor,
    highlightColor: AppColor.whiteColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColor.mainLightColor,
      unselectedItemColor: AppColor.lightGreyColor,
      backgroundColor: AppColor.whiteColor,
    ),
    floatingActionButtonTheme:FloatingActionButtonThemeData(
      shape:RoundedRectangleBorder(
        borderRadius:BorderRadiusGeometry.circular(40)
      ),
      backgroundColor:AppColor.mainLightColor
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20Black,
      headlineMedium: AppStyles.medium16Black,
      bodyLarge: AppStyles.regular16Black,
      headlineSmall: AppStyles.semi14MainLightColor,
      labelMedium: AppStyles.medium16MainColor,
      labelSmall: AppStyles.medium18MainColor,
      labelLarge: AppStyles.semi14MainLightColor,
      bodyMedium: AppStyles.semi16MainLightColor,
      bodySmall: AppStyles.medium14Black,
      titleLarge: AppStyles.regular14MainLightColor,
      titleMedium: AppStyles.medium20Black,
      titleSmall: AppStyles.medium18Black,
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.darkBgColor,
    primaryColor: AppColor.mainDarkColor,
    dividerColor: AppColor.mainLightColor,
    highlightColor: AppColor.darkInputColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.darkBgColor,
      selectedItemColor: AppColor.mainDarkColor,
      unselectedItemColor: AppColor.lightGreyColor,
    ),
    floatingActionButtonTheme:FloatingActionButtonThemeData(
        shape:RoundedRectangleBorder(
            borderRadius:BorderRadiusGeometry.circular(40)
        ),
        backgroundColor:AppColor.mainDarkColor
    ),

    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColor.mainDarkColor,
    ),
    textTheme: TextTheme(
      headlineLarge: AppStyles.semi20White,
      headlineMedium: AppStyles.medium16White,
      bodyLarge: AppStyles.regular14WhiteDarkColor,
      headlineSmall: AppStyles.semi24White,
      labelMedium: AppStyles.medium16MainColor,
      labelSmall: AppStyles.medium18MainColor,
      labelLarge: AppStyles.semi14MainDarkColor,
      bodyMedium: AppStyles.semi16MainDark,
      bodySmall: AppStyles.medium14White,
      titleLarge: AppStyles.regular14WhiteDarkColor,
      titleMedium: AppStyles.medium20White,
      titleSmall: AppStyles.medium18White,
    ),
  );
}
