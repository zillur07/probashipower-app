import 'package:flutter/material.dart';
import 'package:probashipower_app/src/config/colors.dart';

class AppTheme {
  static final appTheme = ThemeData(
    scaffoldBackgroundColor: white,
    useMaterial3: true,
    // brightness: Brightness.light,
    fontFamily: regular,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: white,
        fontSize: 14,
      ),
      iconTheme: IconThemeData(
        color: Colors.white, // Set the drawer icon color to black
      ),
    ),
  );
}
