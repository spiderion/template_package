import 'package:flutter/material.dart';

import '../base_theme.dart';

ThemeData appThemeLight = baseTheme.copyWith(
  brightness: _colorScheme.brightness,
  unselectedWidgetColor: _colorScheme.onSurface.withOpacity(0.55),
  textTheme: _textTheme,
  scaffoldBackgroundColor: _colorScheme.surface,
  colorScheme: _colorScheme,
  cardColor: _colorScheme.surface,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: _colorScheme.surface),
  appBarTheme: baseTheme.appBarTheme
      .copyWith(backgroundColor: _colorScheme.surface, titleTextStyle: _textTheme.titleLarge),
  elevatedButtonTheme: baseTheme.elevatedButtonTheme,
);

TextTheme _textTheme = ThemeData.light().textTheme;

ColorScheme _colorScheme =
    baseColorScheme.copyWith(surface: Colors.white, onSurface: Colors.black, brightness: Brightness.light);
