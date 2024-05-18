import 'package:flutter/material.dart';

import '../core/constants/material_constants/material_constants.dart';

ThemeData baseTheme = ThemeData(
    colorScheme: baseColorScheme,
    primarySwatch: primarySwatch,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: Colors.red),
    cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    appBarTheme: AppBarTheme(backgroundColor: baseColorScheme.surface, centerTitle: true),
    textTheme: _textTheme,
    shadowColor: Colors.black12,
    elevatedButtonTheme: _elevatedButtonTheme,
    outlinedButtonTheme: _outlineButtonThemeData(),
    dialogTheme: DialogTheme(
        backgroundColor: baseColorScheme.surface,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(MaterialConstants.ALERT_DIALOG_RADIUS)),
        contentTextStyle: TextStyle()),
    buttonTheme: ButtonThemeData(buttonColor: baseColorScheme.primary, shape: StadiumBorder()),
    fontFamily: MaterialFont.PRIMARY);

ElevatedButtonThemeData _elevatedButtonTheme = ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 20)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)))));

TextTheme _textTheme = TextTheme(titleLarge: _appBarTextStyle);

TextStyle _appBarTextStyle = TextStyle(fontWeight: MaterialFontWeight.BOLD);

OutlinedButtonThemeData _outlineButtonThemeData() => OutlinedButtonThemeData(
        style: ButtonStyle(
      shape: WidgetStateProperty.all(StadiumBorder()),
      side: WidgetStateProperty.all(BorderSide(color: primarySwatch)),
    ));

MaterialColor primarySwatch = Colors.yellow;

ColorScheme baseColorScheme = ColorScheme.dark(
    primary: Color(0xFF28AFFA),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFF054A91),
    secondary: Color(0xFFA823CD),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFF3762C),
    surface: Color.fromRGBO(24, 28, 34, 1),
    error: Color(0xFFB00020),
    onError: Color(0xFFFFFFFF));
