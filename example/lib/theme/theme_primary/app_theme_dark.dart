import 'package:flutter/material.dart';

import '../base_theme.dart';

ThemeData appThemeDark = baseTheme.copyWith(
  brightness: _colorScheme.brightness,
  unselectedWidgetColor: _colorScheme.onSurface.withOpacity(0.55),
  textTheme: _textTheme,
  textSelectionTheme: ThemeData.dark().textSelectionTheme,
  colorScheme: _colorScheme,
  scaffoldBackgroundColor: _colorScheme.surface,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: _colorScheme.surface),
  elevatedButtonTheme: baseTheme.elevatedButtonTheme,
  tabBarTheme: TabBarTheme(labelColor: _colorScheme.surface),
  appBarTheme:
      baseTheme.appBarTheme.copyWith(backgroundColor: _colorScheme.surface, titleTextStyle: _textTheme.titleLarge),
  cardTheme:
      CardTheme(color: _colorScheme.surface, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
);

TextTheme _textTheme = ThemeData.dark().textTheme;

ColorScheme _colorScheme = baseColorScheme.copyWith(
    surface: Color.fromRGBO(40, 42, 54, 1),
    onSurface: Colors.white,
    brightness: Brightness.dark);
