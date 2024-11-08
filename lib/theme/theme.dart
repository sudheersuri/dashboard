import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightmode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    secondary: Colors.grey.shade100,
    tertiary: Colors.grey.shade900,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),
);

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    secondary: Colors.grey.shade900,
    tertiary: Colors.white,
  ),
  textTheme: GoogleFonts.poppinsTextTheme(),

);