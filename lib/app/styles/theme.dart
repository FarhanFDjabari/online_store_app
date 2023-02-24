import 'package:flutter/material.dart';
import 'package:online_order_app/app/styles/colors.dart';
import 'package:online_order_app/app/styles/font.dart';

final lightTheme = ThemeData.light().copyWith(
  textTheme: textTheme,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFF42A28),
    onPrimary: Color(0xFF2C0C3C),
    background: Color(0xFFF0F2F6),
    onBackground: Colors.black,
    surface: Color(0xFF37A5C6),
    onSurface: Color(0xFFF0F2F6),
    secondary: lightGrey,
  ),
);

final darkTheme = ThemeData.dark().copyWith(
  textTheme: textTheme,
  colorScheme: const ColorScheme.light(
    primary: Color(0xFFF4AC1C),
    onPrimary: Color(0xFFF0F2F6),
    background: Color(0xFF2C0C3C),
    onBackground: Color(0xFFF0F2F6),
    surface: Color(0xFF641C7C),
    onSurface: Color(0xFFF0F2F6),
    secondary: lightGrey,
  ),
);

ThemeData getAppTheme({bool isDarkMode = false}) {
  return isDarkMode ? darkTheme : lightTheme;
}
