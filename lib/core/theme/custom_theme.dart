import 'package:flutter/material.dart';
import 'app_pallete.dart';

final class CustomTheme {
  static _border([Color color = AppPallete.borderColor]) => OutlineInputBorder(
        borderSide: BorderSide(
          color: color,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPallete.backgroundColor,
      elevation: 0,
    ),
    chipTheme: const ChipThemeData(
      color: MaterialStatePropertyAll(
        AppPallete.backgroundColor,
      ),
      side: BorderSide.none,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(27),
      border: _border(),
      enabledBorder: _border(),
      focusedBorder: _border(AppPallete.gradient2),
      errorBorder: _border(AppPallete.errorColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      iconSize: 25,
      sizeConstraints: BoxConstraints(minHeight: 55, minWidth: 55),
      backgroundColor: AppPallete.gradient2,
      shape: CircleBorder(),
    ),
  );
}
