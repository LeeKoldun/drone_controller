import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.from(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    
    background: Colors.grey[850]!,
    onBackground: Colors.white,

    primary: Colors.purple[800]!,
    onPrimary: Colors.white,

    secondary: Colors.purple[100]!,
    onSecondary: Colors.black,

    tertiary: Colors.purple,
    onTertiary: Colors.white,

    surface: Colors.grey,
    onSurface: Colors.white,

    error: Colors.red,
    onError: Colors.white,
  )
);