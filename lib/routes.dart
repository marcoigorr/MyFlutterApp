import 'package:MyApp/http/http.dart';
import 'package:MyApp/landing/landing.dart';
import 'package:MyApp/cipher/cipher.dart';

var appRoutes = {
  '/landing': (context) => const LandingPage(),
  '/cipher': (context) => const CipherPage(),
  '/http': (context) => const HttpPage(),
};
