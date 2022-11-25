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
      labelMedium: TextStyle(
        fontSize: 12,
        color: Color.fromARGB(255, 169, 169, 169),
        fontWeight: FontWeight.normal,
      ),
      headline1: TextStyle(
        fontSize: 15,
        color: Color.fromARGB(255, 170, 170, 170),
        fontWeight: FontWeight.normal,
      ),
      subtitle1: TextStyle(
          fontSize: 16, fontWeight: FontWeight.normal, color: Colors.grey)),

  // Button Theme
  buttonTheme: ButtonThemeData(),
);
