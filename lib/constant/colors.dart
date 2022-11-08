import 'package:flutter/material.dart';

// ignore: camel_case_types
class AppColor {
  //light theme
  static const Color primaryColor = Color.fromARGB(255, 226, 141, 5);
  static const Color secondaryColor = Color.fromARGB(255, 59, 59, 59);
  static const Color textColor = Colors.black;
  static const Color secondaryTextColor = Colors.white;
}


const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF825500),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDDB3),
  onPrimaryContainer: Color(0xFF291800),
  secondary: Color(0xFF8D37A9),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFBD7FF),
  onSecondaryContainer: Color(0xFF330044),
  tertiary: Color(0xFF51643F),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD4EABB),
  onTertiaryContainer: Color(0xFF102003),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFFFBFF),
  onBackground: Color(0xFF1F1B16),
  surface: Color(0xFFFFFBFF),
  onSurface: Color(0xFF1F1B16),
  surfaceVariant: Color(0xFFF0E0CF),
  onSurfaceVariant: Color(0xFF4F4539),
  outline: Color(0xFF817567),
  onInverseSurface: Color(0xFFF9EFE7),
  inverseSurface: Color(0xFF34302A),
  inversePrimary: Color(0xFFFFB951),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF825500),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB951),
  onPrimary: Color(0xFF452B00),
  primaryContainer: Color(0xFF633F00),
  onPrimaryContainer: Color(0xFFFFDDB3),
  secondary: Color(0xFFF0B0FF),
  onSecondary: Color(0xFF54006D),
  secondaryContainer: Color(0xFF72188F),
  onSecondaryContainer: Color(0xFFFBD7FF),
  tertiary: Color(0xFFB8CDA1),
  onTertiary: Color(0xFF243515),
  tertiaryContainer: Color(0xFF3A4C2A),
  onTertiaryContainer: Color(0xFFD4EABB),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1F1B16),
  onBackground: Color(0xFFEAE1D9),
  surface: Color(0xFF1F1B16),
  onSurface: Color(0xFFEAE1D9),
  surfaceVariant: Color(0xFF4F4539),
  onSurfaceVariant: Color(0xFFD3C4B4),
  outline: Color(0xFF9C8F80),
  onInverseSurface: Color(0xFF1F1B16),
  inverseSurface: Color(0xFFEAE1D9),
  inversePrimary: Color(0xFF825500),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB951),
);
