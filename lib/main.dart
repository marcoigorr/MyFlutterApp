// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:MyApp/landing/landing_page.dart';
import 'package:MyApp/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {

    // Root of application
    return MaterialApp(
      home: LandingPage(),
      theme: appTheme,
    );
  }
}