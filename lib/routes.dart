import 'package:MyApp/http.dart';
import 'package:MyApp/landing/landing.dart';
import 'package:MyApp/home/home.dart';

var appRoutes = {
  '/landing': (context) => const LandingPage(),
  '/home': (context) => const HomePage(),
  '/http': (context) => const HttpPage(),
};
