import 'package:flutter/material.dart';

sealed class AppThemes {
  static final ThemeData light = ThemeData(
    splashFactory: InkSparkle.splashFactory,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      shadowColor: Colors.black38,
    ),
  );
}
