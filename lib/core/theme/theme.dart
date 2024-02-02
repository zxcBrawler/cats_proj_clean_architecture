import 'package:cats_ca/core/theme/colors.dart';
import 'package:flutter/material.dart';

final ThemeData myTheme = ThemeData(
    drawerTheme: const DrawerThemeData(width: 280),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: CustomColors.primaryColor,
        unselectedItemColor: CustomColors.textColor,
        showUnselectedLabels: false),
    appBarTheme: const AppBarTheme(
        color: CustomColors.primaryColor,
        foregroundColor: CustomColors.textColor),
    colorScheme: ColorScheme.fromSwatch().copyWith(
        brightness: Brightness.dark,
        secondary: CustomColors.accentColor,
        primary: CustomColors.primaryColor,
        background: CustomColors.backgroundColor),
    textTheme:
        const TextTheme(bodyLarge: TextStyle(color: CustomColors.textColor)));
