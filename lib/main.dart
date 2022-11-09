// ignore_for_file: prefer_const_constructors
import 'package:MyApp/routes.dart';
import 'package:flutter/material.dart';
import 'package:MyApp/landing/landing.dart';
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
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}