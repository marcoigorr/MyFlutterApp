import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var appTheme = ThemeData(
  brightness: Brightness.dark,

  // Global font family
  fontFamily: GoogleFonts.firaSans().fontFamily,
  
  // Style for Texts
  textTheme: const TextTheme(
    bodyText1: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    bodyText2: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    button: TextStyle(letterSpacing: 1.1, fontWeight: FontWeight.bold)
  ),

  // Button Theme
  buttonTheme: ButtonThemeData(),
);