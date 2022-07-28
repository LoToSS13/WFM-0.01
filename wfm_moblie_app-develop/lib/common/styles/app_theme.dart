import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: backgroundColor,
  colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
  appBarTheme: const AppBarTheme(
    backgroundColor: secondaryColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: secondaryColor,
    unselectedItemColor: backgroundColor,
    selectedItemColor: primaryColor,
  ),

);
