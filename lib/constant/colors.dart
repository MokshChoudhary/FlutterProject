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
  primary: Color(0xFF855300),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFFFDDB8),
  onPrimaryContainer: Color(0xFF2A1700),
  secondary: Color(0xFF006874),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFF97F0FF),
  onSecondaryContainer: Color(0xFF001F24),
  tertiary: Color(0xFF006874),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFF97F0FF),
  onTertiaryContainer: Color(0xFF001F24),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  surfaceContainerHighest: Color(0xFFF1E0D0),
  onSurfaceVariant: Color(0xFF504539),
  outline: Color(0xFF827568),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFFFFB95F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF855300),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB95F),
  onPrimary: Color(0xFF472A00),
  primaryContainer: Color(0xFF653E00),
  onPrimaryContainer: Color(0xFFFFDDB8),
  secondary: Color(0xFF4FD8EB),
  onSecondary: Color(0xFF00363D),
  secondaryContainer: Color(0xFF004F58),
  onSecondaryContainer: Color(0xFF97F0FF),
  tertiary: Color(0xFF4FD8EB),
  onTertiary: Color(0xFF00363D),
  tertiaryContainer: Color(0xFF004F58),
  onTertiaryContainer: Color(0xFF97F0FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceContainerHighest: Color(0xFF504539),
  onSurfaceVariant: Color(0xFFD4C4B5),
  outline: Color(0xFF9C8E80),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFF855300),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB95F),
);
