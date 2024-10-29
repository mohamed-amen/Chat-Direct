import 'package:flutter/material.dart';

class Constants {
  Constants._();

  static Color green = const Color.fromARGB(255, 45, 195, 75);
  static Color darkerGreen = const Color.fromARGB(255, 35, 160, 60);
  static Color? lightGreen = Colors.green[200];
  static Color? darkGrey = Colors.grey[900];
  static Color? grey = Colors.grey[350];
  static Color? red = Colors.red;

  static InputDecoration searchBarDecoration = InputDecoration(
    prefixIcon: const Icon(Icons.search),
    floatingLabelAlignment: FloatingLabelAlignment.center,
    labelStyle: TextStyle(color: Constants.grey),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Constants.green),
    ),
  );

  static ThemeData textFieldTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: Constants.green,
      selectionColor: Constants.lightGreen,
      selectionHandleColor: Constants.green,
    ),
    badgeTheme: BadgeThemeData(backgroundColor: Constants.green),
  );
}
